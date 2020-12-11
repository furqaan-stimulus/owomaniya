import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/payment_failure_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class PaymentFailureView extends StatefulWidget {
  @override
  _PaymentFailureViewState createState() => _PaymentFailureViewState();
}

class _PaymentFailureViewState extends State<PaymentFailureView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentFailureViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Container(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: SvgPicture.asset(
                                          'assets/svg/back_home.svg',
                                          width: 40,
                                          height: 40,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Text(
                                        'Back To Home',
                                        style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FlatButton.icon(
                                        icon: SvgPicture.asset(
                                          'assets/svg/my_consultaion_gray.svg',
                                          height: 18.0,
                                          width: 18.0,
                                        ),
                                        label: Text('My consultation'),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/payment_fail.svg',
                                  width: 45,
                                  height: 45,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Payment Failed',
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Transaction declined by Bank',
                                        style: TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Your query was not sent to an expert',
                                        style: TextStyle(fontSize: 14, color: Colors.pink),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/anyonmans.svg',
                                  width: 45.0,
                                  height: 45.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'You (Anonymous)',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                              height: 15.0,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/ask_expert_pink.svg',
                                      width: 45.0,
                                      height: 45.0,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ask an Expert for Proper consultation.',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            'Unfortunately, your payment did not go through. Please retry making the payment to solve your query by asking an expert.',
                                            overflow: TextOverflow.ellipsis,
                                            textDirection: TextDirection.ltr,
                                            maxLines: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: double.infinity,
                              child: FlatButton.icon(
                                icon: SvgPicture.asset(
                                  'assets/svg/retry_payment.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                label: Text(
                                  "Retry Payment",
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                textColor: Colors.white,
                                padding: EdgeInsets.all(14),
                                onPressed: () {},
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        viewModelBuilder: () => PaymentFailureViewModel());
  }

  Future<String> _getFeedDetail() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var feedDetail = preferences.getString("feed_detail");
    return feedDetail;
  }
}
