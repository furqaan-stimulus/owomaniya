import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/verify_otp_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class VerifyOtpView extends StatefulWidget {
  @override
  _VerifyOtpViewState createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  bool isEditable = false;
  final _otpController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyOtpViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(26.0),
                child: FutureBuilder(
                  future: _getNo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
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
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: SvgPicture.asset(
                                                  'assets/svg/back_home.svg',
                                                  width: 45,
                                                  height: 45,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                'Reset Password',
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
                                      Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              enabled: isEditable,
                                              controller: _mobileNumberController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  hintText: snapshot.data,
                                                  hintStyle: TextStyle(fontSize: 18.0),
                                                  labelText: snapshot.data),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              controller: _otpController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  hintText: 'Enter OTP Number',
                                                  hintStyle: TextStyle(fontSize: 18.0),
                                                  labelText: 'Enter OTP'),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 10.0),
                                                    child: Center(
                                                      child: GestureDetector(
                                                        child: Container(
                                                          child: Text(
                                                            'Resend OTP',
                                                            style: TextStyle(
                                                                fontSize: 16.0,
                                                                fontStyle: FontStyle.normal,
                                                                color: Colors.pink),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          model.sendVerifyOtp();
                                                          print('otp resend');
                                                        },
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
                                                  "RESET PASSWORD",
                                                  style: TextStyle(fontSize: 15.0),
                                                ),
                                                textColor: Colors.white,
                                                padding: EdgeInsets.all(14),
                                                onPressed: () {
                                                  model.verifyMobileNumber(_otpController.text);
                                                },
                                                color: Colors.pink,
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
                          ],
                        ),
                      );
                    } else {
                      return Text('${snapshot.error}');
                    }
                  },
                ),
              ),
            ),
        viewModelBuilder: () => VerifyOtpViewModel());
  }

  Future<String> _getNo() async {
    final SharedPreferences pref = await preferences;
    final String mNo = pref.getString("mobile_no");
    return mNo;
  }
}
