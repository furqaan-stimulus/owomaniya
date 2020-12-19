import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _obscureText = false;

  final _formKey = GlobalKey<FormState>();

  void toggle() {
    setState(() {
      this._obscureText = !this._obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              resizeToAvoidBottomPadding: false,
              key: _scaffoldKey,
              appBar: AppBar(
                backgroundColor: Colors.white,
                bottomOpacity: 30.0,
                shadowColor: Colors.grey,
                title: Padding(
                  padding: const EdgeInsets.only(left: 85.0),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              body: Padding(
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
                            // Column(
                            //   children: [
                            //     SizedBox(
                            //       height: 60,
                            //     ),
                            //     Padding(
                            //       padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                            //       child: Center(
                            //         child: Text(
                            //           'Login',
                            //           style: TextStyle(
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 20,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Divider(
                            //       color: Colors.grey,
                            //     ),
                            //   ],
                            // ),
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
                                      controller: emailController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'Email ID or Phone',
                                          hintStyle: TextStyle(fontSize: 18.0),
                                          labelText: 'Email ID or Phone'),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Email Id or Phone Number';
                                        }
                                        return null;
                                      },
                                    ),
                                    TextFormField(
                                      controller: passwordController,
                                      obscureText: !this._obscureText,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: TextStyle(fontSize: 18.0),
                                        labelText: 'Password',
                                        suffixIcon: IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/svg/show_password.svg',
                                            height: 15,
                                            width: 15,
                                            color: this._obscureText ? Colors.pink : Colors.grey,
                                          ),
                                          onPressed: () {
                                            toggle();
                                          },
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Password is required';
                                        }
                                        return null;
                                      },
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
                                                    'Forgot Password?',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontStyle: FontStyle.normal,
                                                        color: Colors.pink),
                                                  ),
                                                ),
                                                onTap: () {
                                                  model.navigateToForgotPassword();
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
                                          "SIGN IN",
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                        textColor: Colors.white,
                                        padding: EdgeInsets.all(14),
                                        onPressed: () {
                                          FocusManager.instance.primaryFocus.unfocus();
                                          if (_formKey.currentState.validate()) {
                                            model.postLogin(
                                              emailController.text,
                                              passwordController.text,
                                            );
                                          }
                                        },
                                        color: Colors.pink,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Don\'t have An Account ?',
                                              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Center(
                                                child: GestureDetector(
                                                    child: Container(
                                                      child: Text(
                                                        'Sign Up',
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight: FontWeight.bold,
                                                            fontStyle: FontStyle.normal,
                                                            color: Colors.pink),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      FocusManager.instance.primaryFocus.unfocus();
                                                      model.navigateToSignUp();
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
        viewModelBuilder: () => LoginViewModel());
  }
}
