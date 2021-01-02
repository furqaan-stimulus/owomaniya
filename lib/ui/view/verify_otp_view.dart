import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  FocusNode otpFocus;
  FocusNode submitFocus;

  @override
  void initState() {
    super.initState();
    otpFocus = FocusNode();
    submitFocus = FocusNode();
  }

  @override
  void dispose() {
    otpFocus.dispose();
    submitFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return ViewModelBuilder<VerifyOtpViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              key: _scaffoldKey,
              resizeToAvoidBottomInset: false,
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: SvgPicture.asset(
                    'assets/svg/back_home.svg',
                    width: 40,
                    height: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text(
                  "Reset Password",
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: FutureBuilder(
                    future: _getNo(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: ListView(
                            padding: EdgeInsets.only(bottom: bottom),
                            shrinkWrap: true,
                            reverse: true,
                            children: [
                              Container(
                                child: Wrap(
                                  runSpacing: 10.0,
                                  children: [
                                    Column(
                                      children: [
                                        Form(
                                          key: _formKey,
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  height: 200,
                                                ),
                                                TextFormField(
                                                  enabled: isEditable,
                                                  controller: _mobileNumberController,
                                                  keyboardType: TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter.digitsOnly
                                                  ],
                                                  decoration: InputDecoration(
                                                      hintText: snapshot.data,
                                                      hintStyle: TextStyle(fontSize: 18.0),
                                                      labelText: snapshot.data),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  focusNode: otpFocus,
                                                  enabled: true,
                                                  textInputAction: TextInputAction.next,
                                                  onFieldSubmitted: (term) {
                                                    otpFocus.unfocus();
                                                    FocusScope.of(context).requestFocus(submitFocus);
                                                  },
                                                  controller: _otpController,
                                                  keyboardType: TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
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
                                                    focusNode: submitFocus,
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
            ),
        viewModelBuilder: () => VerifyOtpViewModel());
  }

  Future<String> _getNo() async {
    final SharedPreferences pref = await preferences;
    final String mNo = pref.getString("mobile_no");
    return mNo;
  }
}
