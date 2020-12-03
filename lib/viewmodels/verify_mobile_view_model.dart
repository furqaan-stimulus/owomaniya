import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/users.dart';
import 'package:owomaniya/owPreferences/user_preferences.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyMobileViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future<Map<String, dynamic>> verifyMobileNumber(
      String mobileNumber, String otp) async {
    var result;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences != null) {
      mobileNumber = preferences.get('mobile_no');
    }

    final Map<String, dynamic> verifyMobileNumber = {
      'mobile_no': mobileNumber,
      'otp': otp
    };

    setBusy(true);

    Response response = await post(
      ApiUrls.VERIFY_SIGN_UP_MOBILE_OTP_URL,
      body: jsonEncode(verifyMobileNumber),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];
      Users authUser = Users.fromJson(userData);
      UserPreferences().saveUser(authUser);
      _navigationService.navigateTo(route.Routes.loginView);
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
