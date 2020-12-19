import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/user_login.dart';
import 'package:owomaniya/owPreferences/user_preferences.dart';
import 'package:owomaniya/services/authentication_service.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/utils/status.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();
  final AuthenticationService _authenticationService = getIt<AuthenticationService>();

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

  //
  // Future<dynamic> login(
  //   String username,
  //   String password,
  // ) async {
  //   var loginResult = await _authenticationService.postLogin(username, password);
  //
  //   return await Future.delayed(
  //     Duration(seconds: 2),
  //     () {
  //       if (loginResult is bool) {
  //         _navigationService.pushNamedAndRemoveUntil(route.Routes.loginView);
  //         print('if $loginResult');
  //       } else {
  //         _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
  //         print('else $loginResult');
  //       }
  //     },
  //   );
  // }

  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  Future<Map<String, dynamic>> postLogin(
    String username,
    String password,
  ) async {
    var result;
    String deviceType = 'mobile';
    String deviceOs = 'android';

    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password,
      'device_type': deviceType,
      'device_os': deviceOs,
      'device_token': ApiUrls.DEVICE_TOKEN,
    };
    _loggedInStatus = Status.Authenticating;
    setBusy(true);

    http.Response response = await http.post(
      ApiUrls.USER_LOGIN_URL,
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json', 'accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final SharedPreferences preferences = await SharedPreferences.getInstance();

      var userData = responseData;
      UserLogin authUser = UserLogin.fromJson(userData);
      UserPreferences().saveUser(authUser);

      preferences.setString('email_address', authUser.data.user.emailAddress);
      preferences.setString('mobile_no', authUser.data.user.mobileNo);
      preferences.setString('token', authUser.data.token);
      preferences.setString('first_name', authUser.data.user.firstName);
      preferences.setString('last_name', authUser.data.user.lastName);
      preferences.setString('user_image', authUser.data.user.userImage);

      _loggedInStatus = Status.LoggedIn;
      Fluttertoast.showToast(msg: 'Login successful');
      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('login success $result');
      var log = preferences.getString('token');
      print('login token $log');
      _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      Fluttertoast.showToast(msg: 'Login Failed');
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('login fail $result');
    }
    return json.decode(response.body);
  }

  void logout() async {
    UserPreferences().removeUser();
    _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
  }
}
