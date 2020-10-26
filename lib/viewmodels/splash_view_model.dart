import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseModel {
  NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToWalkThrough() async {
    _navigationService.pushNamedAndRemoveUntil(route.Routes.onBoardView);
  }
}
