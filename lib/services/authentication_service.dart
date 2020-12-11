import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:owomaniya/model/user_login.dart';
import 'package:owomaniya/owPreferences/user_preferences.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/utils/status.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService extends BaseModel {
  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  User _currentUser;

  User get currentUser => _currentUser;

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

    Response response = await post(
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
      setBusy(true);

      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('login success $result');
      var log = preferences.getString('token');
      print('login token $log');

      setBusy(false);
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      setBusy(true);
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('login fail $result');
      setBusy(false);
    }
    return json.decode(response.body);
  }
}
