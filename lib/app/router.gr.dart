// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/view/ask_expert_view.dart';
import '../ui/view/ask_query_view.dart';
import '../ui/view/bookmark_view.dart';
import '../ui/view/consultation_view.dart';
import '../ui/view/forgot_password_view.dart';
import '../ui/view/full_consultation_view.dart';
import '../ui/view/home_view.dart';
import '../ui/view/login_view.dart';
import '../ui/view/my_consultation_view.dart';
import '../ui/view/onboard_view.dart';
import '../ui/view/payment_failure_view.dart';
import '../ui/view/payment_method_view.dart';
import '../ui/view/payment_successful_view.dart';
import '../ui/view/privacy_policy_view.dart';
import '../ui/view/register_as_expert_view.dart';
import '../ui/view/reset_password_view.dart';
import '../ui/view/share_your_voice_view.dart';
import '../ui/view/signup_view.dart';
import '../ui/view/splash_view.dart';
import '../ui/view/terms_of_service_view.dart';
import '../ui/view/user_profile_view.dart';
import '../ui/view/verify_mobile_view.dart';
import '../ui/view/verify_otp_view.dart';
import '../ui/view/voices_view.dart';

class Routes {
  static const String splashView = '/';
  static const String onBoardView = '/on-board-view';
  static const String homeView = '/home-view';
  static const String askQueryView = '/ask-query-view';
  static const String signUpView = '/sign-up-view';
  static const String loginView = '/login-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String resetPasswordView = '/reset-password-view';
  static const String verifyOtpView = '/verify-otp-view';
  static const String verifyMobileView = '/verify-mobile-view';
  static const String paymentMethodView = '/payment-method-view';
  static const String paymentSuccessView = '/payment-success-view';
  static const String paymentFailureView = '/payment-failure-view';
  static const String consultationView = '/consultation-view';
  static const String shareYourVoiceView = '/share-your-voice-view';
  static const String userProfileView = '/user-profile-view';
  static const String privacyPolicyView = '/privacy-policy-view';
  static const String termsOfServiceView = '/terms-of-service-view';
  static const String registerAsExpertView = '/register-as-expert-view';
  static const String bookmarkView = '/bookmark-view';
  static const String voicesView = '/voices-view';
  static const String askExpertView = '/ask-expert-view';
  static const String fullConsultationView = '/full-consultation-view';
  static const String myConsultationView = '/my-consultation-view';
  static const all = <String>{
    splashView,
    onBoardView,
    homeView,
    askQueryView,
    signUpView,
    loginView,
    forgotPasswordView,
    resetPasswordView,
    verifyOtpView,
    verifyMobileView,
    paymentMethodView,
    paymentSuccessView,
    paymentFailureView,
    consultationView,
    shareYourVoiceView,
    userProfileView,
    privacyPolicyView,
    termsOfServiceView,
    registerAsExpertView,
    bookmarkView,
    voicesView,
    askExpertView,
    fullConsultationView,
    myConsultationView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.onBoardView, page: OnBoardView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.askQueryView, page: AskQueryView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.resetPasswordView, page: ResetPasswordView),
    RouteDef(Routes.verifyOtpView, page: VerifyOtpView),
    RouteDef(Routes.verifyMobileView, page: VerifyMobileView),
    RouteDef(Routes.paymentMethodView, page: PaymentMethodView),
    RouteDef(Routes.paymentSuccessView, page: PaymentSuccessView),
    RouteDef(Routes.paymentFailureView, page: PaymentFailureView),
    RouteDef(Routes.consultationView, page: ConsultationView),
    RouteDef(Routes.shareYourVoiceView, page: ShareYourVoiceView),
    RouteDef(Routes.userProfileView, page: UserProfileView),
    RouteDef(Routes.privacyPolicyView, page: PrivacyPolicyView),
    RouteDef(Routes.termsOfServiceView, page: TermsOfServiceView),
    RouteDef(Routes.registerAsExpertView, page: RegisterAsExpertView),
    RouteDef(Routes.bookmarkView, page: BookmarkView),
    RouteDef(Routes.voicesView, page: VoicesView),
    RouteDef(Routes.askExpertView, page: AskExpertView),
    RouteDef(Routes.fullConsultationView, page: FullConsultationView),
    RouteDef(Routes.myConsultationView, page: MyConsultationView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    OnBoardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnBoardView(),
        settings: data,
      );
    },
    HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => HomeViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(key: args.key),
        settings: data,
      );
    },
    AskQueryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AskQueryView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotPasswordView(),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ResetPasswordView(),
        settings: data,
      );
    },
    VerifyOtpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VerifyOtpView(),
        settings: data,
      );
    },
    VerifyMobileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VerifyMobileView(),
        settings: data,
      );
    },
    PaymentMethodView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PaymentMethodView(),
        settings: data,
      );
    },
    PaymentSuccessView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PaymentSuccessView(),
        settings: data,
      );
    },
    PaymentFailureView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PaymentFailureView(),
        settings: data,
      );
    },
    ConsultationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ConsultationView(),
        settings: data,
      );
    },
    ShareYourVoiceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShareYourVoiceView(),
        settings: data,
      );
    },
    UserProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserProfileView(),
        settings: data,
      );
    },
    PrivacyPolicyView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PrivacyPolicyView(),
        settings: data,
      );
    },
    TermsOfServiceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TermsOfServiceView(),
        settings: data,
      );
    },
    RegisterAsExpertView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterAsExpertView(),
        settings: data,
      );
    },
    BookmarkView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => BookmarkView(),
        settings: data,
      );
    },
    VoicesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VoicesView(),
        settings: data,
      );
    },
    AskExpertView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AskExpertView(),
        settings: data,
      );
    },
    FullConsultationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FullConsultationView(),
        settings: data,
      );
    },
    MyConsultationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyConsultationView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({this.key});
}
