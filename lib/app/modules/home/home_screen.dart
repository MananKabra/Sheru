import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/auth/controllers/auth_controller.dart';
import 'package:get_flutter_fire/app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authController.clearUserData();
            Get.offAllNamed(Routes.WELCOME);
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
