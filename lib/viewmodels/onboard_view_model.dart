import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToHomeScreen() async {
    _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
  }
}
