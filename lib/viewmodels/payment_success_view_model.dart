import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class PaymentSuccessViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToHomeView() async {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  Future navigateToMyConsultationView() async {
    _navigationService.navigateTo(Routes.myConsultationView);
  }
}
