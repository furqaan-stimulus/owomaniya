class ApiUrls {
  static const String SIGN_UP = "signup";
  static const String VERIFICATION_MAIL = "verificationmail";
  static const String LOGIN = "login";
  static const String CHANGE_PASSWORD = "changepassword";
  static const String VERIFY_OTP = "verifyotp";
  static const String FORGOT_PASSWORD = "forgotpassword";
  static const String VERIFY_MOBILE = "verifymobile";
  static const String VERIFY_EMAIL = "verifyemail";
  static const String SEND_VERIFICATION_OTP = "otp";
  static const String SLASH = '/';

  static const String LiveURL = "";
  static const String LocalURL = "";
  static const String DevURL = "";
  static const String BaseURL = "";
  static const String USER_SIGN_UP = LocalURL + SLASH + SIGN_UP;
  static const String GET_VERIFICATION_LINK =
      LocalURL + SLASH + VERIFICATION_MAIL;
  static const String USER_LOGIN = LiveURL + SLASH + LOGIN;
  static const String CHANGE_PASSWORD_URL = LiveURL + SLASH + CHANGE_PASSWORD;
  static const String VERIFY_OTP_URL = LiveURL + SLASH + VERIFY_OTP;
  static const String FORGOT_PASSWORD_URL = LiveURL + SLASH + FORGOT_PASSWORD;
  static const String VERIFY_MOBILE_URL = DevURL + SLASH + VERIFY_MOBILE;
  static const String VERIFY_EMAIL_URL = DevURL + SLASH + VERIFY_EMAIL;
  static const String SEND_VERIFICATION_OTP_URL =
      LocalURL + SLASH + SEND_VERIFICATION_OTP;
}
