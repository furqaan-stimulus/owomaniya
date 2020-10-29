import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class AskQueryViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();
  final DialogService _dialogService = getIt<DialogService>();

  Future navigateToSignUpView() async {
    _navigationService.navigateTo(route.Routes.signUpView);
  }

  Future gSignOut() async {
    var signOutResponse = await _dialogService.showDialog(
        title: 'Are you sure ?',
        description: 'Do you log out from this account ?',
        buttonTitle: 'Yes',
        cancelTitle: 'No');
    if (signOutResponse.confirmed) {
      setBusy(true);
      _navigationService.pushNamedAndRemoveUntil(route.Routes.onBoardView);
    }
  }
}
