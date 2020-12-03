import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/payment_method_view_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

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
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        'Amount \u20B9 99',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8.0),
                                      child: SvgPicture.asset(
                                        'assets/svg/anyonmans.svg',
                                        width: 45.0,
                                        height: 45.0,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'You (Anonymous)',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(
                                  'Sample Query Part Disclaimer: Information provide by an expert here is for general informational purpose only and it should NOT be considered as substitute for professional expert(medical,psychological or fitness advice) as complete physical assessment of an individual has not been done. Please consult your nearest doctor/expert before acting on it. The advice is also not valid for medico-legal purposes.',
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                color: Colors.black12,
                              ),
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
                                          'Pay \u20B9 80 online',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 17.0),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                            'assets/svg/visa.svg'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                            'assets/svg/mastercard.svg'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                            'assets/svg/paytm.svg'),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 20,
                                        child: Checkbox(
                                          onChanged: (newValue) {
                                            setState(() {
                                              onChecked = !onChecked;
                                            });
                                          },
                                          value: onChecked,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Container(
                                        child: Text(
                                          'Use \u20B9 19 from Health Piggy',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 7,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                            'assets/svg/sidebar_amount.svg'),
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
                                      Container(
                                        child: Text(
                                          'Current Balance \u20B9 20',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
                                  model.navigateToPaymentSuccessView();
                                  // model.navigateToPaymentFailureView();
                                  // openCheckout();
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 10);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 10);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 10);
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_7C6vWyX6b57U9i',
      'amount': 9900,
      'name': 'OW Application',
      'description': 'Test OW app',
      'prefill': {
        'contact': '9727692148',
        'email': 'furqaan.stimulus@gmail.com'
      },
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
}
