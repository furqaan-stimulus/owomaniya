import 'dart:async';
import 'dart:convert';
import 'package:device_info/device_info.dart';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/user_login.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/utils/status.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:owomaniya/Enums/device_os.dart';
import 'package:owomaniya/Enums/device_type.dart';
import 'dart:io';

class SignUpViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Status _registeredInStatus = Status.NotRegistered;

  Status get registeredStatus => _registeredInStatus;

  Future navigateToLogin() async {
    await _navigationService.navigateTo(route.Routes.loginView);
  }

  Future<Map<String, dynamic>> postSignUp(String email, String mobileNumber, String dateOfBirth,
      String gender, String password, String firstName, String lastName) async {
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
        headers: {'content-Type': 'application/json'}).then(onValue).catchError(onError);
  }

  Future<FutureOr> onValue(Response response) async {
    var result;
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      var userData = responseData;
      UserLogin authUser = UserLogin.fromJson(userData);

      var userId = preferences.setInt("user_id", authUser.data.user.id);
      var email = preferences.setString("email_address", authUser.data.user.emailAddress);
      var mobileNumber = preferences.setString("mobile_no", authUser.data.user.mobileNo);
      _navigationService.pushNamedAndRemoveUntil(route.Routes.verifyMobileView);
      var getId;
      var getMail;
      var getNo;
      if (preferences != null) {
        getId = preferences.getString('user_id');
        getMail = preferences.getString('email_address');
        getNo = preferences.getString('mobile_no');
      }

      print('id-- $userId');
      print('email --$email');
      print('no --$mobileNumber');

      await sendEmail(getMail);
      print('${sendEmail(getMail)}');
      await sendVerifyOtp(getId, getNo);
      print('${sendVerifyOtp(getId, getNo)}');
      result = {'status': true, 'message': 'Successfully registered', 'data': userData};
      print('$result');
    } else {
      _navigationService.pushNamedAndRemoveUntil(route.Routes.signUpView);
      result = {'status': false, 'message': 'Registration failed', 'data': responseData};
      print('$result');
    }
    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

  Future<Map<String, dynamic>> sendVerifyOtp(String userId, String mobileNumber) async {
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
        body: jsonEncode(otpData), headers: {'content-Type': 'application/json'});

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
        body: jsonEncode(sendVerifyEmail), headers: {'content-Type': 'application/json'});

    return jsonDecode(response.body);
  }

  Future navigateToTerms() async {
    await _navigationService.navigateTo(route.Routes.termsOfServiceView);
  }

  Future navigateToPrivacy() async {
    await _navigationService.navigateTo(route.Routes.privacyPolicyView);
  }
}
