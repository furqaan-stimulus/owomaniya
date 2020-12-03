import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/verify_mobile_view_model.dart';
import 'package:stacked/stacked.dart';

class VerifyMobileView extends StatefulWidget {
  @override
  _VerifyMobileViewState createState() => _VerifyMobileViewState();
}

class _VerifyMobileViewState extends State<VerifyMobileView> {
  final _mobileNumberController = TextEditingController();
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyMobileViewModel>.reactive(
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
                                    child: Text(
                                      'Verify Mobile With OTP',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 150,
                            ),
                            Form(
                              key: _formKey,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: _mobileNumberController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          hintText: 'Your phone Number',
                                          hintStyle: TextStyle(fontSize: 18.0),
                                          labelText: 'Your Phone Number'),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Phone Number to receive OTP';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _otpController,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: 'Enter OTP',
                                        hintStyle: TextStyle(fontSize: 18.0),
                                        labelText: 'Enter OTP',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Center(
                                              child: GestureDetector(
                                                child: Container(
                                                  child: Text(
                                                    'Resend OTP',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: Colors.black),
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
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: FlatButton(
                                        child: Text(
                                          "Confirm",
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => VerifyMobileViewModel());
  }
}
