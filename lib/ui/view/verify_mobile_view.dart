import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owomaniya/viewmodels/verify_mobile_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class VerifyMobileView extends StatefulWidget {
  @override
  _VerifyMobileViewState createState() => _VerifyMobileViewState();
}

class _VerifyMobileViewState extends State<VerifyMobileView> {
  final _otpController = TextEditingController();
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isEditable = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyMobileViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              key: _scaffoldKey,
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
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                                        child: Center(
                                          child: Text(
                                            'Verify Mobile With OTP',
                                            style: TextStyle(
                                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 200,
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            enabled: isEditable,
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                                hintStyle: TextStyle(fontSize: 18.0), labelText: snapshot.data),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: _otpController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
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
                                                  padding: const EdgeInsets.only(left: 10.0),
                                                  child: Center(
                                                    child: GestureDetector(
                                                      child: Container(
                                                        child: Text(
                                                          'Resend OTP',
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontStyle: FontStyle.normal,
                                                              color: Colors.black),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        model.sendVerifyOtp();
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
                                                "Confirm",
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
        viewModelBuilder: () => VerifyMobileViewModel());
  }

  Future<String> _getNo() async {
    final SharedPreferences pref = await preferences;
    final String mNo = pref.getString("mobile_no");
    return mNo;
  }
}
