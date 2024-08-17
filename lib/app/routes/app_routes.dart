abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const WELCOME = _Paths.WELCOME;
  static const LOGIN = _Paths.LOGIN;
  static const OTP = _Paths.OTP;
  static const REGISTER = _Paths.REGISTER;
  static const ADDRESS = _Paths.ADDRESS;
  static const ROOT = _Paths.ROOT;
}

abstract class _Paths {
  static const String SPLASH = '/';
  static const String WELCOME = '/welcome';
  static const String LOGIN = '/login';
  static const String OTP = '/otp';
  static const String REGISTER = '/register';
  static const String ADDRESS = '/address';
  static const String ROOT = '/root';
}
