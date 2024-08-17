import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/auth/controllers/auth_controller.dart';
import 'package:get_flutter_fire/models/address_model.dart';
import 'package:get_flutter_fire/models/user_model.dart';
import 'package:get_flutter_fire/services/auth_service.dart';
import 'package:get_flutter_fire/app/routes/app_routes.dart';
import 'package:uuid/uuid.dart';

class AddressController extends GetxController {
  final AuthService authService = Get.find<AuthService>();
  final AuthController authController = Get.find<AuthController>();

  final line1Controller = TextEditingController();
  final line2Controller = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();

  final latitudeController = TextEditingController(text: '');
  final longitudeController = TextEditingController(text: '');

  late UserModel user;

  @override
  void onInit() {
    super.onInit();
    user = Get.arguments['user'] as UserModel;
  }

  void saveAddress() {
    const uuid = Uuid();
    String addressID = uuid.v4();

    AddressModel address = AddressModel(
      name: user.name,
      phoneNumber: user.phoneNumber,
      line1: line1Controller.text,
      line2: line2Controller.text,
      city: cityController.text,
      district: districtController.text,
      latitude: latitudeController.text.isEmpty
          ? 0.0
          : double.parse(latitudeController.text),
      longitude: longitudeController.text.isEmpty
          ? 0.0
          : double.parse(longitudeController.text),
      id: addressID,
      userID: user.id,
    );

    authService.saveAddress(address);
    authController.updateUserAddress(user, addressID);

    Get.offAllNamed(Routes.ROOT);
  }

  @override
  void onClose() {
    line1Controller.dispose();
    line2Controller.dispose();
    cityController.dispose();
    districtController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    super.onClose();
  }
}
