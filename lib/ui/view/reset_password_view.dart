import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/reset_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _rePasswordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = false;

  void toggle() {
    setState(() {
      this._obscureText = !this._obscureText;
    });
  }

  FocusNode pwd;
  FocusNode rPwd;
  FocusNode submitFocus;

  @override
  void initState() {
    super.initState();
    pwd = FocusNode();
    rPwd = FocusNode();
    submitFocus = FocusNode();
  }

  @override
  void dispose() {
    pwd.dispose();
    rPwd.dispose();
    submitFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              key: _scaffoldKey,
              resizeToAvoidBottomInset: false,
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Padding(
                  padding: const EdgeInsets.only(left: 85.0),
                  child: Text(
                    "Reset Password",
                    style:
                        TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Container(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: bottom),
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
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 200,
                                          ),
                                          TextFormField(
                                            enabled: true,
                                            textInputAction: TextInputAction.next,
                                            onFieldSubmitted: (term) {
                                              pwd.unfocus();
                                              FocusScope.of(context).requestFocus(rPwd);
                                            },
                                            obscureText: !this._obscureText,
                                            controller: _passwordController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              labelText: 'Enter Password',
                                              hintText: 'Enter Password',
                                              hintStyle: TextStyle(fontSize: 18.0),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.remove_red_eye,
                                                  color:
                                                      this._obscureText ? Colors.pink : Colors.grey,
                                                ),
                                                onPressed: () {
                                                  toggle();
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //Retype password
                                          TextFormField(
                                            focusNode: rPwd,
                                            enabled: true,
                                            textInputAction: TextInputAction.next,
                                            onFieldSubmitted: (term) {
                                              rPwd.unfocus();
                                              FocusScope.of(context).requestFocus(submitFocus);
                                            },
                                            onChanged: (val) {
                                              if (_passwordController.text == val) {
                                                _passwordController.text =
                                                    _rePasswordController.text;
                                              } else {}
                                            },
                                            obscureText: !this._obscureText,
                                            controller: _rePasswordController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              labelText: 'Re-Type Password',
                                              hintText: 'Re-Type Password',
                                              hintStyle: TextStyle(fontSize: 18.0),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.remove_red_eye,
                                                  color:
                                                      this._obscureText ? Colors.pink : Colors.grey,
                                                ),
                                                onPressed: () {
                                                  toggle();
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: FlatButton(
                                              focusNode: submitFocus,
                                              child: Text(
                                                "SAVE PASSWORD",
                                                style: TextStyle(fontSize: 15.0),
                                              ),
                                              textColor: Colors.white,
                                              padding: EdgeInsets.all(14),
                                              onPressed: () {
                                                model.resetPassword(_passwordController.text,
                                                    _rePasswordController.text);
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
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => ResetPasswordViewModel());
  }
}
