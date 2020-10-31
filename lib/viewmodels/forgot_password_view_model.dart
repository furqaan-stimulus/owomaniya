import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToVerifyOtp() async {
    _navigationService.navigateTo(route.Routes.verifyOtpView);
  }

  Future<Map<String, dynamic>> forgotPassword(String mobileNumber) async {
    var result;

    final Map<String, dynamic> forgotPassword = {
      'mobile_no': mobileNumber,
    };

    setBusy(true);

    Response response = await post(
      ApiUrls.FORGOT_PASSWORD_URL,
      body: jsonEncode(forgotPassword),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      _navigationService.navigateTo(route.Routes.verifyOtpView);
      result = {
        'status': true,
        'message': 'Successful',
      };
    } else {
      setBusy(true);
      result = {'status': false, 'message': 'fail'};

      Fluttertoast.showToast(msg: 'Error to send otp');

      print('forgot password $result');
    }
    return result;
  }
}
