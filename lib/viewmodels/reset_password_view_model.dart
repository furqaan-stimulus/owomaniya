import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class ResetPasswordViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateBackToLogin() async {
    _navigationService.pushNamedAndRemoveUntil(route.Routes.loginView);
  }

  Future<Map<String, dynamic>> resetPassword(
      String mobileNumber, String newPassword, String confirmPassword) async {
    var result;
    final Map<String, dynamic> resetPwd = {
      'mobile_no': mobileNumber,
      'new_password': newPassword,
      'confirm_password': confirmPassword
    };

    setBusy(true);
    Response response = await post(
      ApiUrls.CHANGE_PASSWORD_URL,
      body: json.encode(resetPwd),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      _navigationService.pushNamedAndRemoveUntil(route.Routes.loginView);

      result = {
        'status': true,
        'message': 'Successful',
      };
    } else {
      setBusy(true);
      result = {'status': false, 'message': 'fail'};

      Fluttertoast.showToast(msg: 'Error');
    }
    return result;
  }
}
