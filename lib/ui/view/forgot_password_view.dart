import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/forgot_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatelessWidget {
  final _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
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
                                          'Forgot Password?',
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
                                            child: TextField(
                                              maxLines: 1,
                                              controller: _mobileController,
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
                                            height: 20,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: FlatButton(
                                              child: Text(
                                                "SEND OTP",
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                              textColor: Colors.white,
                                              padding: EdgeInsets.all(14),
                                              onPressed: () {
                                                model.navigateToVerifyOtp();
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
        viewModelBuilder: () => ForgotPasswordViewModel());
  }
}
