import 'dart:convert';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/user.dart';
import 'package:owomaniya/owPreferences/user_preferences.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToVerifyOtp() async {
    _navigationService.navigateTo(route.Routes.verifyOtpView);
  }

  Future<Map<String, dynamic>> forgotPassword(String mobileNumber) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var result;
    final Map<String, dynamic> forgotPassword = {
      'mobile_no': mobileNumber,
    };

    preferences.setString("mobile_no", mobileNumber);

    setBusy(true);
    Response response = await post(
      ApiUrls.FORGOT_PASSWORD_URL,
      body: jsonEncode(forgotPassword),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      _navigationService.navigateTo(route.Routes.verifyOtpView);
      result = {
        'status': true,
        'message': response.statusCode,
      };
      print(result);
    } else {
      setBusy(true);
      result = {'status': false, 'message': response.statusCode};
      print('forgot password $result');
    }
    return jsonDecode(response.body);
  }
}
