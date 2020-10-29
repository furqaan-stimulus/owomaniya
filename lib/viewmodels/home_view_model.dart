import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();


  Future navigateToQueryView() async {
    _navigationService.navigateTo(route.Routes.askQueryView);
  }




}
