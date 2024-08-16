import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/auth/bindings/auth_bindings.dart';
import 'package:get_flutter_fire/app/modules/auth/views/login_screen.dart';
import 'package:get_flutter_fire/app/modules/auth/views/otp_screen.dart';
import 'package:get_flutter_fire/app/modules/auth/views/register_screen.dart';
import 'package:get_flutter_fire/app/modules/home/home_screen.dart';
import 'package:get_flutter_fire/app/modules/splash/splash_screen.dart';
import 'package:get_flutter_fire/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
    ),
  ];
}
