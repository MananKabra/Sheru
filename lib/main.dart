import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/routes/app_pages.dart';
import 'package:get_flutter_fire/services/auth_service.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sheru',
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      initialBinding: BindingsBuilder(
        () {
          Get.put(AuthService());
        },
      ),
      theme: ThemeData(
        highlightColor: Colors.black.withOpacity(0.5),
        bottomSheetTheme:
            const BottomSheetThemeData(surfaceTintColor: Colors.blue),
      ),
    ),
  );
}
