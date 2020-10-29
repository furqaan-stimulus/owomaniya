import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/verify_otp_view_model.dart';
import 'package:stacked/stacked.dart';

class VerifyOtpView extends StatefulWidget {
  @override
  _VerifyOtpViewState createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyOtpViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Card(
                  margin: const EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 10,
                  child: Container(
                    child: Wrap(
                      runSpacing: 5.0,
                      children: [
                        ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Center(
                              heightFactor: 1.2,
                              child: Wrap(
                                runSpacing: 5,
                                children: [
                                  Center(
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            60.0, 30.0, 60.0, 20.0),
                                        child: Text(
                                          'Enter Your OTP',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              'Mobile Number',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: TextField(
                                              maxLines: 1,
                                              controller: _otpController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Enter phone Number',
                                                  hintStyle:
                                                      TextStyle(fontSize: 18.0),
                                                  labelText:
                                                      'Enter Phone Number'),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: Center(
                                                    child: GestureDetector(
                                                      child: Container(
                                                        child: Text(
                                                          'Resend OTP',
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              color:
                                                                  Colors.pink),
                                                        ),
                                                      ),
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: FlatButton(
                                              child: Text(
                                                "RESET PASSWORD",
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                              textColor: Colors.white,
                                              padding: EdgeInsets.all(14),
                                              onPressed: () {
                                                model.navigateToResetPassword();
                                              },
                                              color: Colors.pink,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => VerifyOtpViewModel());
  }
}
