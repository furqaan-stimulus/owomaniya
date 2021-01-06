import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/payment_success_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class PaymentSuccessView extends StatefulWidget {
  @override
  _PaymentSuccessViewState createState() => _PaymentSuccessViewState();
}

class _PaymentSuccessViewState extends State<PaymentSuccessView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentSuccessViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/svg/back_home.svg',
              height: 40,
              width: 40,
            ),
          ),
          title: Text(
            'Back To Home',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 18.0),
              child: Container(
                  height: 50,
                  width: 155,
                  child: FlatButton.icon(
                    icon: SvgPicture.asset(
                      'assets/svg/my_consultaion_gray.svg',
                      height: 18.0,
                      width: 18.0,
                    ),
                    label: Text('My consultation'),
                    onPressed: () {
                      model.navigateToMyConsultationView();
                    },
                  )),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 20, 10.0, 0.0),
          child: FutureBuilder(
            future: getPaymentId(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: SvgPicture.asset(
                              'assets/svg/payment_success.svg',
                              width: 50,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Success',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  snapshot.data,
                                  style: TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Your query was successfully posted',
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
                            width: 50,
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
                                      padding: const EdgeInsets.all(8.0),
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
                        height: 20.0,
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Text(
                          'Your query has been posted successfully. We will assign best suitable expert and your query will answered soon. Thank you for using The OoWomaniya, Women Health First!',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          width: double.infinity,
                          child: FlatButton.icon(
                            icon: SvgPicture.asset(
                              'assets/svg/ask_expert_gray.svg',
                              height: 20.0,
                              width: 20.0,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Go to Query",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            textColor: Colors.white,
                            padding: EdgeInsets.all(14),
                            onPressed: () async {
                              model.navigateToMyConsultationView();
                            },
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
      viewModelBuilder: () => PaymentSuccessViewModel(),
      onModelReady: (model) {},
    );
  }

  Future<String> getPaymentId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var payId = preferences.getString('payment_id');
    return payId;
  }

  Future<String> _getFeedDetail() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var feedDetail = preferences.getString("feed_detail");
    return feedDetail;
  }
}
