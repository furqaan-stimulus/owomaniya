import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class PaymentFailureViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToPaymentMethodView() async {
    _navigationService.pushNamedAndRemoveUntil(Routes.paymentMethodView);
  }
}
