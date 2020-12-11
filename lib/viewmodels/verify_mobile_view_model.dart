import 'dart:convert';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyMobileViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future<Map<String, dynamic>> verifyMobileNumber(String otp) async {
    var result;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mobileNumber = preferences.get('mobile_no');

    final Map<String, dynamic> verifyMobileNumber = {'mobile_no': mobileNumber, 'otp': otp};

    setBusy(true);

    Response response = await post(
      ApiUrls.VERIFY_SIGN_UP_MOBILE_OTP_URL,
      body: jsonEncode(verifyMobileNumber),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      _navigationService.pushNamedAndRemoveUntil(route.Routes.loginView);
      result = {
        'status': true,
        'message': 'Successful',
      };
      print(result);
    } else {
      setBusy(true);
      result = {'status': false, 'message': 'fail'};
      print('verify mobile $result');
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> sendVerifyOtp() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var userId = preferences.getInt('user_id');
    var mobileNumber = preferences.getString('mobile_no');

    final Map<String, dynamic> otpData = {
      'user_id': userId,
      'mobile_no': mobileNumber,
    };

    Response response = await post(ApiUrls.SEND_VERIFICATION_OTP_URL,
        body: jsonEncode(otpData), headers: {'content-Type': 'application/json'});

    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }
}
