import 'dart:convert';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyOtpViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToResetPassword() async {
    _navigationService.navigateTo(route.Routes.resetPasswordView);
  }

  Future<Map<String, dynamic>> verifyMobileNumber(String otp) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var result;
    var mobileNumber = preferences.getString('mobile_no');

    final Map<String, dynamic> verifyMobileNumber = {'mobile_no': mobileNumber, 'otp': otp};

    setBusy(true);
    Response response = await post(
      ApiUrls.VERIFY_OTP_URL,
      body: json.encode(verifyMobileNumber),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      _navigationService.pushNamedAndRemoveUntil(route.Routes.resetPasswordView);
      result = {
        'status': true,
        'message': response.body,
      };
      print(result);
    } else {
      setBusy(true);
      result = {'status': false, 'message': response.body};
      print('verify mobile $result');
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> sendVerifyOtp() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var mobileNumber = preferences.getString('mobile_no');

    print(mobileNumber);
    final Map<String, dynamic> otpData = {
      'mobile_no': mobileNumber,
    };

    Response response = await post(ApiUrls.FORGOT_PASSWORD_URL,
        body: jsonEncode(otpData), headers: {'content-Type': 'application/json'});

    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }
}
