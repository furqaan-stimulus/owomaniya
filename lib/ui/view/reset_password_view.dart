import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:owomaniya/viewmodels/reset_password_view_model.dart';
import 'package:stacked/stacked.dart';

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _rePasswordController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _obscureText = false;

  void toggle() {
    setState(() {
      this._obscureText = !this._obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
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
                                        'Reset Password',
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
                                            obscureText: !this._obscureText,
                                            controller: _passwordController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              labelText: 'Enter Password',
                                              hintText: 'Enter Password',
                                              hintStyle:
                                                  TextStyle(fontSize: 18.0),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.remove_red_eye,
                                                  color: this._obscureText
                                                      ? Colors.pink
                                                      : Colors.grey,
                                                ),
                                                onPressed: () {
                                                  toggle();
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        //Retype password
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0),
                                          child: TextField(
                                            maxLines: 1,
                                            onChanged: (val) {
                                              if (_passwordController.text ==
                                                  val) {
                                                _passwordController.text =
                                                    _rePasswordController
                                                        .text;
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Password enter not match');
                                              }
                                            },
                                            obscureText: !this._obscureText,
                                            controller: _rePasswordController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              labelText: 'Re-Type Password',
                                              hintText: 'Re-Type Password',
                                              hintStyle:
                                                  TextStyle(fontSize: 18.0),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.remove_red_eye,
                                                  color: this._obscureText
                                                      ? Colors.pink
                                                      : Colors.grey,
                                                ),
                                                onPressed: () {
                                                  toggle();
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: FlatButton(
                                            child: Text(
                                              "SAVE PASSWORD",
                                              style:
                                                  TextStyle(fontSize: 15.0),
                                            ),
                                            textColor: Colors.white,
                                            padding: EdgeInsets.all(14),
                                            onPressed: () {
                                              model.navigateBackToLogin();
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
        viewModelBuilder: () => ResetPasswordViewModel());
  }
}
