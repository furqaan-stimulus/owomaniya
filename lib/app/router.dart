import 'package:auto_route/auto_route_annotations.dart';
import 'package:owomaniya/ui/view/ask_query_view.dart';
import 'package:owomaniya/ui/view/forgot_password_view.dart';
import 'package:owomaniya/ui/view/home_view.dart';
import 'package:owomaniya/ui/view/login_view.dart';
import 'package:owomaniya/ui/view/onboard_view.dart';
import 'package:owomaniya/ui/view/payment_failure_view.dart';
import 'package:owomaniya/ui/view/payment_method_view.dart';
import 'package:owomaniya/ui/view/payment_successful_view.dart';
import 'package:owomaniya/ui/view/reset_password_view.dart';
import 'package:owomaniya/ui/view/verify_otp_view.dart';
import 'package:owomaniya/ui/view/verify_mobile_view.dart';
import 'package:owomaniya/ui/view/signup_view.dart';
import 'package:owomaniya/ui/view/splash_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: OnBoardView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: AskQueryView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: ForgotPasswordView),
  MaterialRoute(page: ResetPasswordView),
  MaterialRoute(page: VerifyOtpView),
  MaterialRoute(page: VerifyMobileView),
  MaterialRoute(page: PaymentMethodView),
  MaterialRoute(page: PaymentSuccessView),
  MaterialRoute(page: PaymentFailureView),
])
class $Router {}
