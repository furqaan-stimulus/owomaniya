import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/utils/size_config.dart';
import 'package:owomaniya/viewmodels/forgot_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatelessWidget {
  final _mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
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
                            Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 10.0, 10.0, 5.0),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/svg/back_home.svg',
                                            width: 40,
                                            height: 40,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Forgot Password',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 150,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _mobileController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    hintText: 'Enter phone Number',
                                    hintStyle: TextStyle(fontSize: 18.0),
                                    labelText: 'Enter Phone Number'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter Phone Number to receive OTP';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: double.infinity,
                                child: FlatButton(
                                  child: Text(
                                    "SEND OTP",
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(14),
                                  onPressed: () {
                                    // if (_formKey.currentState.validate()) {
                                    //   model.forgotPassword(
                                    //       _mobileController.text);
                                    // }
                                    model.navigateToVerifyOtp();
                                  },
                                  color: Colors.pink,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => ForgotPasswordViewModel());
  }
}
