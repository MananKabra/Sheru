import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/auth/controllers/auth_controller.dart';
import 'package:get_flutter_fire/app/routes/app_routes.dart';
import 'package:get_flutter_fire/models/user_model.dart';
import 'package:get_flutter_fire/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final authService = Get.find<AuthService>();
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Name',
          ),
        ),
        TextField(
          controller: _phoneNumberController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            String userID = authService.userID;
            UserModel user = UserModel(
              id: userID,
              name: _nameController.text,
              phoneNumber: _phoneNumberController.text,
            );
            authController.registerUser(user);
            Get.offNamed(Routes.HOME);
          },
          child: const Text('Register'),
        ),
      ],
    ));
  }
}
