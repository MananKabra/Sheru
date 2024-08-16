import 'package:get/get.dart';
import 'package:get_flutter_fire/constants.dart';
import 'package:get_flutter_fire/models/user_model.dart';

class AuthController extends GetxService {
  // late Rxn<EmailAuthCredential> credential = Rxn<EmailAuthCredential>();
  // final Rxn<User> _firebaseUser = Rxn<User>();
  // final Rx<Role> _userRole = Rx<Role>(Role.buyer);
  // final Rx<bool> robot = RxBool(useRecaptcha);
  // final RxBool registered = false.obs;

  Rxn<UserModel> _user = Rxn<UserModel>();
  UserModel? get user => _user.value;

  Future<void> fetchUserData(String userID) async {
    try {
      var doc = await usersRef.doc(userID).get();
      if (doc.exists) {
        _user.value = UserModel.fromMap(doc.data()!);
      }
    } catch (error) {
      _user.value = null;
      Get.snackbar('Error', 'Failed to fetch user data');
    }
  }

  Future<void> registerUser(UserModel user) async {
    try {
      await usersRef.doc(user.id).set(user.toMap());
      _user.value = user;
    } catch (error) {
      Get.snackbar('Error', 'Failed to register user');
    }
  }
}
