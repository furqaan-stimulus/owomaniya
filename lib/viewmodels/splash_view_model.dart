import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToWalkThrough() async {
    _navigationService.pushNamedAndRemoveUntil(route.Routes.onBoardView);
  }
}
