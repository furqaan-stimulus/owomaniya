import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:owomaniya/utils/regex.dart';
import 'package:owomaniya/viewmodels/signup_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<String> gender = ['Male', 'Female'];
  String _currentGender = 'Female';

  bool _obscureText = false;
  String _birthDate;
  bool isFirstNameValid = true;

  void toggle() {
    setState(() {
      this._obscureText = !this._obscureText;
    });
  }

  var now = DateTime.now();
  ValueNotifier<DateTime> _dateTimeNotifier = ValueNotifier<DateTime>(Jiffy(DateTime.now()).subtract(years: 13));

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final top = MediaQuery.of(context).viewInsets.top;
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottomOpacity: 30.0,
          shadowColor: Colors.grey,
          title: Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
          child: Container(
            child: ListView(
              padding: EdgeInsets.only(bottom: bottom, top: top),
              shrinkWrap: true,
              reverse: true,
              children: <Widget>[
                Container(
                  child: Wrap(
                    runSpacing: 10.0,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                            //   child: Center(
                            //     child: Text(
                            //       'Sign Up',
                            //       textAlign: TextAlign.center,
                            //       softWrap: true,
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Divider(
                            //   color: Colors.grey,
                            // ),
                            TextFormField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                hintText: 'First Name',
                                hintStyle: TextStyle(fontSize: 18.0),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Your First Name is Required';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                hintText: 'Last Name',
                                hintStyle: TextStyle(fontSize: 18.0),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Your Last Name is Required';
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: DateTimePicker(
                                  type: DateTimePickerType.date,
                                  dateMask: 'dd-MM-yyyy',
                                  initialValue: _dateTimeNotifier.value.toString(),
                                  firstDate: DateTime(1960),
                                  lastDate: _dateTimeNotifier.value,
                                  onChanged: (val) {
                                    setState(() {
                                      _birthDate = val;
                                    });
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Your date of birth is Empty';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    _birthDate = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Date of Birth',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  onChanged: (String value) {
                                    setState(() {
                                      _currentGender = value;
                                    });
                                  },
                                  items: gender.map((gender) {
                                    return DropdownMenuItem(
                                      value: gender,
                                      child: Text('$gender'),
                                    );
                                  }).toList(),
                                  value: _currentGender,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Email',
                                hintStyle: TextStyle(fontSize: 18.0),
                              ),
                              validator: validateEmail,
                            ),
                            TextFormField(
                              controller: _mobileController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(fontSize: 18.0),
                              ),
                              validator: validateMobileNumber,
                            ),
                            TextFormField(
                              obscureText: !this._obscureText,
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(fontSize: 18.0),
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
                                  return 'Your Password is Required';
                                } else if (value.length < 6) {
                                  return 'Your password length should be more than 6 characters';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
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
                                  return 'Your must retype the Password';
                                } else if (value.length < 6) {
                                  return 'Your password length should be more than 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'By signing up you accept our ',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            child: Text(
                                              'Terms of service ',
                                              style: TextStyle(fontSize: 12.0, color: Colors.blue),
                                            ),
                                          ),
                                          onTap: () {
                                            model.navigateToTerms();
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'and ',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            child: Text(
                                              'Privacy Policy',
                                              style: TextStyle(fontSize: 12.0, color: Colors.blue),
                                            ),
                                          ),
                                          onTap: () {
                                            model.navigateToPrivacy();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              child: FlatButton(
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                textColor: Colors.white,
                                padding: EdgeInsets.all(14),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    model.postSignUp(
                                        _emailController.text,
                                        _mobileController.text,
                                        _birthDate,
                                        _currentGender,
                                        _passwordController.text,
                                        _firstNameController.text,
                                        _lastNameController.text);
                                  }
                                },
                                color: Colors.pink,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Have An Account ?',
                                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                        child: Center(
                                          child: GestureDetector(
                                            child: Container(
                                              child: Text(
                                                'Sign In',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.pink),
                                              ),
                                            ),
                                            onTap: () {
                                              model.navigateToLogin();
                                            },
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
