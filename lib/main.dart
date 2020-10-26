import 'package:flutter/material.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/ui/view/splash_view.dart';

import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NavigationService _navigationService = getIt<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigationService.navigatorKey,
      onGenerateRoute: route.Router().onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashView(),
    );
  }
}
