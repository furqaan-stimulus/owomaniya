import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/forgot_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  FocusNode mNumber;

  FocusNode submitFocus;

  @override
  void initState() {
    super.initState();
    mNumber = FocusNode();
    submitFocus = FocusNode();
  }

  @override
  void dispose() {
    mNumber.dispose();
    submitFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
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
                  "Forgot Password",
                  style:
                      TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Container(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: bottom),
                      reverse: true,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Form(
                            key: _formKey,
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                  ),
                                  TextFormField(
                                    focusNode: mNumber,
                                    enabled: true,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (term) {
                                      mNumber.unfocus();
                                      FocusScope.of(context).requestFocus(submitFocus);
                                    },
                                    controller: _mobileController,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
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
                                      focusNode: submitFocus,
                                      child: Text(
                                        "SEND OTP",
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                      textColor: Colors.white,
                                      padding: EdgeInsets.all(14),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          model.forgotPassword(_mobileController.text);
                                        }
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
              ),
            ),
        viewModelBuilder: () => ForgotPasswordViewModel());
  }
}
