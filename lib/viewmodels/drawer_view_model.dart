import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:owomaniya/app/router.gr.dart' as route;

class DrawerViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();
  final DialogService _dialogService = getIt<DialogService>();

  Future navigateToQueryView() async {
    _navigationService.navigateTo(route.Routes.askQueryView);
  }

  Future navigateToShareYourVoiceView() async {
    _navigationService.navigateTo(route.Routes.shareYourVoiceView);
  }

  Future navigateToPaymentMethodView() async {
    _navigationService.navigateTo(route.Routes.paymentMethodView);
  }

  Future navigateToUserProfileView() async {
    _navigationService.navigateTo(route.Routes.userProfileView);
  }

  Future navigateToRegisterAsExpertView() async {
    _navigationService.navigateTo(route.Routes.registerAsExpertView);
  }

  Future navigateToBookmarkView() async {
    _navigationService.navigateTo(route.Routes.bookmarkView);
  }

  Future navigateToVoicesView() async {
    _navigationService.navigateTo(route.Routes.voicesView);
  }

  Future navigateToLoginView() async {
    _navigationService.navigateTo(route.Routes.loginView);
  }

  Future navigateToMyConsultationView() async {
    _navigationService.navigateTo(route.Routes.myConsultationView);
  }

  Future logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.setString("token", null);
    var response;
    response = await _dialogService.showDialog(
      title: 'Are You Sure',
      description: 'Do You want to Logout',
      buttonTitle: 'Logout ',
      cancelTitle: 'Cancel',
    );
    if (token == null) {
      _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
    }
  }

  Future<String> isUserSignedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    return token;
  }

  String _token;

  String get token => _token;
}
