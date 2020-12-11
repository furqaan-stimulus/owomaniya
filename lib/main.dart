import 'package:flutter/material.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/services/authentication_service.dart';
import 'package:owomaniya/ui/view/splash_view.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(
    MyApp(),
  );
} 

class MyApp extends StatelessWidget {
  final NavigationService _navigationService = getIt<NavigationService>();
  final AuthenticationService _authenticationService =
      getIt<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return Provider<AuthenticationService>(
      create: (_) => _authenticationService,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigationService.navigatorKey,
        onGenerateRoute: route.Router().onGenerateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: SplashView(),
      ),
    );
  }
}
