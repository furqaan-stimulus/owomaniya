import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
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

  Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    var result;
    String deviceType = 'mobile';
    String deviceOs = 'android';

    final Map<String, dynamic> login = {
      'username': username,
      'password': password,
      'device_type': deviceType,
      'device_os': deviceOs,
      'device_token': ApiUrls.LOGIN_TOKEN
    };
    setBusy(true);

    Response response = await post(
      ApiUrls.USER_LOGIN_URL,
      body: jsonEncode(login),
      headers: {'Content-Type': 'application/json'},
    );
    print(ApiUrls.USER_LOGIN_URL);
    print(login);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      SharedPrefs().saveUser(authUser);
      _navigationService.navigateTo(route.Routes.askQueryView);
      result = {
        'status': true,
        'data': {'message': responseData['data'], 'user': authUser}
      };
    } else {
      setBusy(true);
      result = {'status': false, 'message': response.toString()};

      Fluttertoast.showToast(msg: 'Error in login');

      print('login fail $result');
    }
    return result;
  }
}
