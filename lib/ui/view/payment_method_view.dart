import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/payment_method_view_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PaymentMethodView extends StatefulWidget {
  @override
  _PaymentMethodViewState createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  Razorpay _razorPay;
  bool onChecked = false;

  @override
  void dispose() {
    super.dispose();
    _razorPay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentMethodViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  child: Wrap(
                    runSpacing: 10.0,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/svg/wallet_pink.svg',
                                            width: 40,
                                            height: 40,
                                          ),
                                          onPressed: () {},
                                        ),
                                        Text(
                                          'Payment Method',
                                          style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        'Amount \u20B9 99',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                                        child: SvgPicture.asset(
                                          'assets/svg/anyonmans.svg',
                                          width: 45.0,
                                          height: 45.0,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'You (Anonymous)',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/edit_number.svg',
                                        height: 15.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('Edit'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            FutureBuilder(
                              future: _getFeedDetail(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Text(
                                              snapshot.data,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black12),
                                            color: Colors.black12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Text('${snapshot.error}');
                                }
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.pink,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Container(
                                        child: Text(
                                          'Pay \u20B9 99 online',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 17.0),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        child: SvgPicture.asset('assets/svg/visa.svg'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        child: SvgPicture.asset('assets/svg/mastercard.svg'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        child: SvgPicture.asset('assets/svg/paytm.svg'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'You can use your credit/debit card, Internet banking or PayTM',
                                          softWrap: true,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 8.0),
                            //   child: Column(
                            //     children: [
                            //       Row(
                            //         children: [
                            //           Container(
                            //             height: 30,
                            //             width: 20,
                            //             child: Checkbox(
                            //               onChanged: (newValue) {
                            //                 setState(() {
                            //                   onChecked = !onChecked;
                            //                 });
                            //               },
                            //               value: onChecked,
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 15.0,
                            //           ),
                            //           Container(
                            //             child: Text(
                            //               'Use \u20B9 19 from Health Piggy',
                            //               overflow: TextOverflow.ellipsis,
                            //               maxLines: 7,
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 15.0,
                            //           ),
                            //           Container(
                            //             child: SvgPicture.asset(
                            //                 'assets/svg/sidebar_amount.svg'),
                            //           ),
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: 10.0,
                            //       ),
                            //       Row(
                            //         children: [
                            //           SizedBox(
                            //             width: 40.0,
                            //           ),
                            //           Container(
                            //             child: Text(
                            //               'Current Balance \u20B9 20',
                            //               overflow: TextOverflow.ellipsis,
                            //               maxLines: 2,
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: double.infinity,
                              child: FlatButton(
                                child: Text(
                                  "Pay \u20B9 99 Online",
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                textColor: Colors.white,
                                padding: EdgeInsets.all(14),
                                onPressed: () {
                                  // model.navigateToPaymentSuccessView();
                                  openCheckout();
                                },
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => PaymentMethodViewModel(),
      onModelReady: (model) {},
    );
  }

  final NavigationService _navigationService = getIt<NavigationService>();

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var paymentId = preferences.setString("payment_id", response.paymentId);
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 20);
    // queryPayment();
    _navigationService.pushNamedAndRemoveUntil(Routes.paymentSuccessView);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message, timeInSecForIosWeb: 10);
    _navigationService.pushNamedAndRemoveUntil(Routes.paymentFailureView);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 10);
    _navigationService.pushNamedAndRemoveUntil(Routes.paymentFailureView);
  }

  Future<void> openCheckout() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var mobileNo = preferences.getString('mobile_no');
    var email = preferences.getString('email_address');
    print('pay $email');
    print('pay $mobileNo');
    var options = {
      'key': ApiUrls.razorKey,
      'amount': 9900,
      'name': 'OW Application',
      'description': 'Test OW app',
      'prefill': {'contact': mobileNo, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorPay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> _getFeedDetail() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var feedDetail = preferences.getString("feed_detail");
    return feedDetail;
  }

  Future<Map<String, dynamic>> queryPayment() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var orderId = preferences.getInt('order_id');
    var paymentId = preferences.getString('payment_id');
    var token = preferences.getString('token');

    print(orderId);
    print(paymentId);
    print(99);
    final Map<String, dynamic> paymentData = {
      "order_id": orderId,
      "payment_type": "cc",
      "payment_status": "Successfull",
      "payment_id": paymentId,
      "amount": 99,
    };
    Response response = await post(
      ApiUrls.QUERY_PAYMENT_URL + token,
      body: json.encode(paymentData),
    );
    var result;
    if (response.statusCode == 200) {
      // final Map<String, dynamic> responseData = json.decode(response.body);
      print(' pay body${jsonDecode(response.body)}');
      result = {'status': true, 'message': 'code ${response.statusCode} '};
    } else {
      print(' pay body${jsonDecode(response.body)}');
      result = {'status': false, 'message': 'code ${response.statusCode} '};
    }
    return jsonDecode(response.body);
  }
}
