import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToWalkThrough() async {
    _navigationService.pushNamedAndRemoveUntil(route.Routes.onBoardView);
  }

  Future<bool> isUserSignedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getString('user_id');
    if (userId != null) {
      setBusy(true);
      await _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
    } else {
      await _navigationService
          .pushNamedAndRemoveUntil(route.Routes.onBoardView);
    }
    return true;
  }
}
