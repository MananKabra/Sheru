import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/auth/controllers/auth_controller.dart';
import 'package:get_flutter_fire/app/routes/app_routes.dart';
import 'package:get_flutter_fire/services/auth_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('OTP'),
          PinCodeTextField(
            appContext: context,
            length: 6,
            controller: _otpController,
            validator: (v) {
              if (v!.length < 6) {
                return "Please Enter Valid OTP";
              } else {
                return null;
              }
            },
          ),
          ElevatedButton(
            onPressed: () async {
              bool success = await authService.verifyOTP(_otpController.text);
              if (success) {
                final authController = Get.find<AuthController>();
                await authController.fetchUserData(authService.userID);
                if (authController.user == null) {
                  Get.offNamed(Routes.REGISTER);
                } else {
                  Get.offNamed(Routes.HOME);
                }
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
