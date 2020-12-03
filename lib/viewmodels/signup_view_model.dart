import 'dart:async';
import 'package:device_info/device_info.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/services/api_service.dart';
import 'package:owomaniya/services/authentication_service.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();
  final ApiService _apiService = getIt<ApiService>();
  final AuthenticationService _authenticationService =
      getIt<AuthenticationService>();
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future navigateToLogin() async {
    await _navigationService.navigateTo(route.Routes.loginView);
  }

  Future navigateToVerifyMobileView() async {
    await _navigationService.navigateTo(route.Routes.verifyMobileView);
  }

  Future<dynamic> signUp(String email, String mobileNumber, String dateOfBirth,
      String gender, String password, String firstName, String lastName) async {
    var signUpResult = await _authenticationService.postSignUp(email,
        mobileNumber, dateOfBirth, gender, password, firstName, lastName);

    return await Future.delayed(
      Duration(seconds: 2),
      () {
        if (signUpResult is String) {
          print(signUpResult);
        } else {
          _navigationService.pushNamedAndRemoveUntil(route.Routes.loginView);
          print(signUpResult);
        }
      },
    );
  }

  Future navigateToTerms() async {
    await _navigationService.navigateTo(route.Routes.termsOfServiceView);
  }

  Future navigateToPrivacy() async {
    await _navigationService.navigateTo(route.Routes.privacyPolicyView);
  }
}
