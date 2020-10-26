import 'package:auto_route/auto_route_annotations.dart';
import 'package:owomaniya/ui/view/ask_query_view.dart';
import 'package:owomaniya/ui/view/home_view.dart';
import 'package:owomaniya/ui/view/login_view.dart';
import 'package:owomaniya/ui/view/signup_view.dart';
import 'package:owomaniya/ui/view/splash_view.dart';
import 'file:///G:/flutter/owomaniya/lib/ui/view/onboard_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: OnBoardView),
  MaterialRoute(page: AskQueryView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: LoginView)
])
class $Router {}
