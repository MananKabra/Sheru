import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login'),
          TextField(
            controller: _phoneNumberController,
            decoration: const InputDecoration(
              hintText: 'Phone Number',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              authService.verifyPhoneNumber(_phoneNumberController.text);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
