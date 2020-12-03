import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/users.dart';
import 'package:owomaniya/owPreferences/user_preferences.dart';
import 'package:owomaniya/services/authentication_service.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/utils/status.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();
  final AuthenticationService _authenticationService =
      getIt<AuthenticationService>();

  Future navigateToSignUp() async {
    await _navigationService.navigateTo(route.Routes.signUpView);
  }

  Future navigateToForgotPassword() async {
    _navigationService.navigateTo(route.Routes.forgotPasswordView);
  }

  Future navigateToAskQueryView() async {
    _navigationService.navigateTo(route.Routes.askQueryView);
  }

  Future navigateToPaymentMethod() async {
    _navigationService.navigateTo(route.Routes.paymentMethodView);
  }

  Future<dynamic> login(
    String username,
    String password,
  ) async {
    var loginResult =
        await _authenticationService.postLogin(username, password);

    return await Future.delayed(
      Duration(seconds: 2),
      () {
        if (loginResult is bool) {
          _navigationService.pushNamedAndRemoveUntil(route.Routes.loginView);
          print('if $loginResult');
        } else {
          _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
          print('else $loginResult');
        }
      },
    );

  }


  void logout() async {
    UserPreferences().removeUser();
    print('$Users');
    _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
  }
}
