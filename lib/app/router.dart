import 'package:auto_route/auto_route_annotations.dart';
import 'package:owomaniya/ui/view/home_view.dart';
import 'package:owomaniya/ui/view/splash_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: HomeView)
])
class $Router {}
