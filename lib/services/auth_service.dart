import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/routes/app_routes.dart';
import 'package:get_flutter_fire/constants.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  String _verificationId = '';

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  String get userID => auth.currentUser!.uid;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    _phoneNumber = phoneNumber;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'Invalid Phone Number. Please try again.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        Get.toNamed(Routes.OTP);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: otp);
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        return true;
      }
      return false;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-verification-code') {
        Get.snackbar('Error', 'Invalid OTP. Please try again.');
      }
      return false;
    }
  }
}
