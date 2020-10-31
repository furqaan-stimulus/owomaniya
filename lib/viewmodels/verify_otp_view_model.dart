import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyOtpViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToResetPassword() async {
    _navigationService.navigateTo(route.Routes.resetPasswordView);
  }

  Future<Map<String, dynamic>> verifyMobileNumber(
      String mobileNumber, String otp) async {
    var result;
    final Map<String, dynamic> verifyMobileNumber = {
      'mobile_no': mobileNumber,
      'otp': otp
    };

    setBusy(true);

    Response response = await post(
      ApiUrls.VERIFY_OTP,
      body: jsonEncode(verifyMobileNumber),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      result = {
        'status': true,
        'message': 'Successful',
      };
    } else {
      setBusy(true);
      result = {'status': false, 'message': 'fail'};

      Fluttertoast.showToast(msg: 'Error');

      print('verify mobile $result');
    }
    return result;
  }
}
