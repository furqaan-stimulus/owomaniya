import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
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
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
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
                                              color: this._obscureText ? Colors.pink : Colors.grey,
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
                                      TextField(
                                        onChanged: (val) {
                                          if (_passwordController.text == val) {
                                            _passwordController.text = _rePasswordController.text;
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
                                              color: this._obscureText ? Colors.pink : Colors.grey,
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
                                          child: Text(
                                            "SAVE PASSWORD",
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                          textColor: Colors.white,
                                          padding: EdgeInsets.all(14),
                                          onPressed: () {
                                            model.resetPassword(
                                                _passwordController.text, _rePasswordController.text);
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
                ),
              ),
            ),
        viewModelBuilder: () => ResetPasswordViewModel());
  }
}
