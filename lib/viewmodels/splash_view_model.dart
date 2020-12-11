import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  NavigationService _navigationService = getIt<NavigationService>();

  Future<bool> isUserSignedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    if (token == null) {
      setBusy(true);
      await _navigationService.pushNamedAndRemoveUntil(route.Routes.onBoardView);
    } else {
      await _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
    }
    return token != null;
  }
}
