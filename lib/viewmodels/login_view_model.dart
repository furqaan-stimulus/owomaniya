import 'dart:convert';

import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/user.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/utils/shared_preferences.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToSignUp() async {
    await _navigationService.navigateTo(route.Routes.signUpView);
  }

  Future navigateToForgotPassword() async {
    _navigationService.navigateTo(route.Routes.forgotPasswordView);
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    var result;

    final Map<String, dynamic> login = {
      'user login': {'username': username, 'password': password}
    };
    setBusy(true);

    Response response = await post(
      ApiUrls.USER_LOGIN,
      body: jsonEncode(login),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      SharedPrefs().saveUser(authUser);
      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      setBusy(true);
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }
}
