import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/user.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/utils/shared_preferences.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToLogin() async {
    await _navigationService.navigateTo(route.Routes.loginView);
  }

  String deviceType = 'mobile';
  String deviceOs = 'android';

  Future<Map<String, dynamic>> signUp(
      String email,
      String mobileNumber,
      String dateOfBirth,
      String gender,
      String password,
      String firstName,
      String lastName) async {
    final Map<String, dynamic> registerData = {
      'email_address': email,
      'mobile_no': mobileNumber,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'password': password,
      'device_type': deviceType,
      'device_os': deviceOs,
      'first_name': firstName,
      'last_name': lastName
    };
    setBusy(true);
    _navigationService.navigateTo(route.Routes.verifyMobileView);

    return await post(ApiUrls.USER_SIGN_UP_URL,
            body: json.encode(registerData),
            headers: {'content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);
    print('signup response $responseData');

    if (response.statusCode == 200) {
      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      SharedPrefs().saveUser(authUser);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
      print('signup success $result');
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
      print('signup fail $result');
    }
    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
