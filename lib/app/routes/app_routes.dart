abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const OTP = _Paths.OTP;
  static const REGISTER = _Paths.REGISTER;
  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  static const String SPLASH = '/';
  static const String LOGIN = '/login';
  static const String OTP = '/otp';
  static const String REGISTER = '/register';
  static const String HOME = '/home';
}
