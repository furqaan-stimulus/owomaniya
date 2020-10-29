import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:owomaniya/viewmodels/signup_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<String> gender = ['Male', 'Female'];
  String _currentGender = 'Male';

  bool _obscureText = false;
  String _birthDate;

  void toggle() {
    setState(() {
      this._obscureText = !this._obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Card(
                  margin: const EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 10,
                  child: Container(
                    child: Wrap(runSpacing: 5.0, children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            //first name
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextField(
                                maxLines: 1,
                                controller: _firstNameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // last name
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextField(
                                maxLines: 1,
                                controller: _lastNameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //DOB
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: DateTimePicker(
                                          type: DateTimePickerType.date,
                                          dateMask: 'dd-MM-yyyy',
                                          initialValue: '',
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2100),
                                          dateLabelText: 'Date of Birth',
                                          onChanged: (val) {
                                            setState(() {
                                              _birthDate = val;
                                            });
                                          },
                                          validator: (val) {
                                            print(val);
                                            return null;
                                          },
                                          onSaved: (val) {
                                            _birthDate = val;
                                          },
                                        ),
                                      ),
                                      flex: 1,
                                    ),

                                    //Gender
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, top: 25.0),
                                        child: DropdownButton<String>(
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
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //Email
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextField(
                                maxLines: 1,
                                controller: _emailController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: 'Enter Email',
                                  hintText: 'Enter Email',
                                  hintStyle: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //mobile number
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextField(
                                maxLines: 1,
                                controller: _mobileController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelText: 'Mobile Number',
                                  hintText: 'Mobile Number',
                                  hintStyle: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //password
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextField(
                                maxLines: 1,
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
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextField(
                                maxLines: 1,
                                onChanged: (val) {
                                  if (_passwordController.text == val) {
                                    _passwordController.text =
                                        _rePasswordController.text;
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Password enter not match');
                                  }
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
                                  model.signUp(
                                      _emailController.text,
                                      _mobileController.text,
                                      _birthDate,
                                      _currentGender,
                                      _passwordController.text,
                                      _firstNameController.text,
                                      _lastNameController.text);
                                },
                                color: Colors.pink,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Have An Account ?',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Center(
                                          child: GestureDetector(
                                            child: Container(
                                              child: Text(
                                                'Sign In',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            onTap: () =>
                                                model.navigateToLogin(),
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
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
