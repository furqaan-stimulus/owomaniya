import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/payment_success_view_model.dart';
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
              body: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
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
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/payment_success.svg',
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
                                  'Payment Success',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Transaction ID',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Your query was successfully posted',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.pink),
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
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                        height: 20.0,
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
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Your query has been posted successfully. We will assign best suitable expert and your query will answered soon. Thank you for using The OoWomaniya, Women Health First!',
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
                          onPressed: () {},
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => PaymentSuccessViewModel());
  }
}
