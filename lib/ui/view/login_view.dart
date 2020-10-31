import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _obscureText = false;

  void toggle() {
    setState(() {
      this._obscureText = !this._obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
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
                                            'Login',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
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
                                                controller: emailController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: 'Enter Email',
                                                  hintStyle: TextStyle(
                                                      fontSize: 18.0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: TextField(
                                                maxLines: 1,
                                                controller:
                                                    passwordController,
                                                obscureText:
                                                    !this._obscureText,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: 'Enter Password',
                                                  hintStyle: TextStyle(
                                                      fontSize: 18.0),
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Center(
                                                      child: GestureDetector(
                                                        child: Container(
                                                          child: Text(
                                                            'Forgot Password?',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                color: Colors
                                                                    .pink),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          model
                                                              .navigateToForgotPassword();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              child: FlatButton(
                                                child: Text(
                                                  "SIGN IN",
                                                  style: TextStyle(
                                                      fontSize: 15.0),
                                                ),
                                                textColor: Colors.white,
                                                padding: EdgeInsets.all(14),
                                                onPressed: () {
                                                  model.login(
                                                    emailController.text,
                                                    passwordController.text,
                                                  );
                                                },
                                                color: Colors.pink,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 20.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Don\'t have An Account ?',
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                    ),
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0),
                                                        child: Center(
                                                          child:
                                                              GestureDetector(
                                                            child: Container(
                                                              child: Text(
                                                                'Sign Up',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                            onTap: () => model
                                                                .navigateToSignUp(),
                                                          ),
                                                        ),
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
        viewModelBuilder: () => LoginViewModel());
  }
}
