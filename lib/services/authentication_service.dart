import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:owomaniya/Enums/device_os.dart';
import 'package:owomaniya/Enums/device_type.dart';

import 'package:owomaniya/model/users.dart';
import 'package:owomaniya/owPreferences/user_preferences.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/utils/status.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService extends BaseModel {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  Status get registeredStatus => _registeredInStatus;

  Future<Map<String, dynamic>> postSignUp(
      String email,
      String mobileNumber,
      String dateOfBirth,
      String gender,
      String password,
      String firstName,
      String lastName) async {
    var os;
    if (Platform.isAndroid) {
      os = DeviceOs.android;
    } else if (Platform.isIOS) {
      os = DeviceOs.ios;
    } else {
      os = DeviceOs.windows;
    }

    final Map<String, dynamic> registerData = {
      'email_address': email,
      'mobile_no': mobileNumber,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'password': password,
      'device_type': DeviceType.mobile.toString(),
      'device_os': os.toString(),
      'first_name': firstName,
      'last_name': lastName
    };

    return await post(ApiUrls.USER_SIGN_UP_URL,
            body: json.encode(registerData),
            headers: {'content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  Future<FutureOr> onValue(Response response) async {
    var result;
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final Map<String, dynamic> responseData = json.decode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {
      var userData = responseData;
      Users authUser = Users.fromJson(userData);
      UserPreferences().saveUser(authUser);

      var userId;
      var email;
      var mobileNumber;
      if (preferences != null) {
        userId = preferences.getString('user_id');
        email = preferences.getString('email_address');
        mobileNumber = preferences.getString('mobile_no');
      }

      print('id-- $userId');
      print('email --$email');
      print('no --$mobileNumber');

      await sendEmail(email);
      print('${sendEmail(email)}');
      await sendVerifyOtp(userId, mobileNumber);
      print('${sendVerifyOtp(userId, mobileNumber)}');
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': userData
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }
    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

  Future<Map<String, dynamic>> sendVerifyOtp(
      String userId, String mobileNumber) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences != null) {
      userId = preferences.getString('user_id');
      mobileNumber = preferences.getString('mobile_no');
    }

    final Map<String, dynamic> otpData = {
      'user_id': userId,
      'mobile_no': mobileNumber,
    };

    Response response = await post(ApiUrls.SEND_VERIFICATION_OTP_URL,
        body: jsonEncode(otpData),
        headers: {'content-Type': 'application/json'});

    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> sendEmail(String email) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences != null) {
      email = preferences.getString('email_address');
    }

    final Map<String, dynamic> sendVerifyEmail = {'email_address': email};

    Response response = await post(ApiUrls.GET_MAIL_VERIFICATION_LINK_URL,
        body: jsonEncode(sendVerifyEmail),
        headers: {'content-Type': 'application/json'});

    return jsonDecode(response.body);
  }

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
      'device_token': ApiUrls.LOGIN_TOKEN
    };
    _loggedInStatus = Status.Authenticating;
    setBusy(true);

    Response response = await post(
      ApiUrls.USER_LOGIN_URL,
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();

      var userData = responseData;
      Users authUser = Users.fromJson(userData);
      UserPreferences().saveUser(authUser);

      preferences.setString('email_address', authUser.emailAddress);
      preferences.setString('mobile_no', authUser.mobileNo);
      preferences.setString('password', authUser.password);
      preferences.setString('first_name', authUser.firstName);
      preferences.setString('last_name', authUser.lastName);

      print('last ${authUser.lastName}');
      _loggedInStatus = Status.LoggedIn;
      setBusy(true);

      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('login success $result');
      setBusy(false);
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      setBusy(true);
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      Fluttertoast.showToast(msg: 'Error in loginData');
      print('login fail $result');
      setBusy(false);
    }
    return json.decode(response.body);
  }
}
