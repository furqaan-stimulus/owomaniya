// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/view/ask_query_view.dart';
import '../ui/view/home_view.dart';
import '../ui/view/login_view.dart';
import '../ui/view/signup_view.dart';
import '../ui/view/splash_view.dart';
import '../ui/view/onboard_view.dart';

class Routes {
  static const String splashView = '/';
  static const String homeView = '/home-view';
  static const String onBoardView = '/on-board-view';
  static const String askQueryView = '/ask-query-view';
  static const String signUpView = '/sign-up-view';
  static const String loginView = '/login-view';
  static const all = <String>{
    splashView,
    homeView,
    onBoardView,
    askQueryView,
    signUpView,
    loginView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.onBoardView, page: OnBoardView),
    RouteDef(Routes.askQueryView, page: AskQueryView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.loginView, page: LoginView),
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
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    OnBoardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnBoardView(),
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
  };
}
