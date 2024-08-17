abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const WELCOME = _Paths.WELCOME;
  static const LOGIN = _Paths.LOGIN;
  static const OTP = _Paths.OTP;
  static const REGISTER = _Paths.REGISTER;
  static const ADDRESS = _Paths.ADDRESS;
  static const ROOT = _Paths.ROOT;
//profile routes
  static const ACCOUNT_DETAILS = _Paths.ACCOUNT_DETAILS;
  static const MANAGE_ADDRESS = _Paths.MANAGE_ADDRESS;
  static const ADD_ADDRESS = _Paths.ADD_ADDRESS;
}

abstract class _Paths {
  static const String SPLASH = '/';
  static const String WELCOME = '/welcome';
  static const String LOGIN = '/login';
  static const String OTP = '/otp';
  static const String REGISTER = '/register';
  static const String ADDRESS = '/address';
  static const String ROOT = '/root';
  //Profile Routes
  static const ACCOUNT_DETAILS = '/account_details';
  static const MANAGE_ADDRESS = '/manage_address';
  static const ADD_ADDRESS = '/add_address';
}
