import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class PaymentMethodViewModel extends BaseModel {
  final NavigationService _networkService = getIt<NavigationService>();

  Future navigateToPaymentSuccessView() async {
    _networkService.navigateTo(Routes.paymentSuccessView);
  }

  Future navigateToPaymentFailureView() async {
    _networkService.navigateTo(Routes.paymentFailureView);
  }
}
