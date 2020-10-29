// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/view/ask_query_view.dart';
import '../ui/view/forgot_password_view.dart';
import '../ui/view/home_view.dart';
import '../ui/view/login_view.dart';
import '../ui/view/onboard_view.dart';
import '../ui/view/reset_password_view.dart';
import '../ui/view/signup_view.dart';
import '../ui/view/splash_view.dart';
import '../ui/view/verify_mobile_view.dart';
import '../ui/view/verify_otp_view.dart';

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
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
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
  };
}
