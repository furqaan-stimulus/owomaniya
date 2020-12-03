import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owomaniya/viewmodels/register_as_expert_view_model.dart';
import 'package:stacked/stacked.dart';

class RegisterAsExpertView extends StatefulWidget {
  @override
  _RegisterAsExpertViewState createState() => _RegisterAsExpertViewState();
}

File _image;

class _RegisterAsExpertViewState extends State<RegisterAsExpertView> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _birthDate;
    String _currentGender = 'Male';
    String _currentCity = 'Ahmedabad';
    String _currentCountry = 'India';
    final List<String> gender = ['Male', 'Female'];
    final List<String> city = [
      'Ahmedabad',
      'Mumbai',
      'Chennai',
      'Kolkata',
      'Pune',
      'Surat'
    ];
    final List<String> country = ['USA', 'UK', 'India', 'Germany'];

    return ViewModelBuilder<RegisterAsExpertViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(26.0, 26.0, 26.0, 0.0),
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                Wrap(
                  runSpacing: 10.0,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/experts.svg',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Join As Expert',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 60,
                                            child: _image != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60),
                                                    child: Image.file(
                                                      _image,
                                                      width: 120,
                                                      height: 120,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                    ),
                                                    width: 100,
                                                    height: 100,
                                                    child: Icon(
                                                      Icons.camera_alt,
                                                    ),
                                                  ),
                                          ),
                                          Positioned(
                                            bottom: 0, right: 18,
                                            // top: 12,
                                            child: GestureDetector(
                                              onTap: () {
                                                print('image tap');
                                                _showPicker(context);
                                              },
                                              child: ClipOval(
                                                child: Container(
                                                  color: Colors.pink,
                                                  height: 30,
                                                  width: 30,
                                                  child: Center(
                                                    child: SvgPicture.asset(
                                                      'assets/svg/profile_edit_icon.svg',
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Container(
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('First Name*'),
                                      TextFormField(
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
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text('Last Name*'),
                                      TextFormField(
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('Email*'),
                            Container(
                              width: 310,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  hintStyle: TextStyle(fontSize: 18.0),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Your Email is Required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Mobile Number*'),
                                    Container(
                                      width: 150,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'Mobile Number',
                                          hintText: 'Mobile Number',
                                          hintStyle: TextStyle(fontSize: 18.0),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Your Mobile Number is Required';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Date of Birth'),
                                    SizedBox(
                                      height: 11.0,
                                    ),
                                    Container(
                                      width: 150,
                                      child: DateTimePicker(
                                        type: DateTimePickerType.date,
                                        dateMask: 'dd-MM-yyyy',
                                        initialValue: '',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
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
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Gender'),
                                    Container(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          child:
                                              DropdownButtonFormField<String>(
                                            validator: (value) => value == null
                                                ? 'Your gender is required'
                                                : null,
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
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('City'),
                                    Container(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          child:
                                              DropdownButtonFormField<String>(
                                            validator: (value) => value == null
                                                ? 'Your city is required'
                                                : null,
                                            disabledHint: Text(_currentCity),
                                            isExpanded: true,
                                            onChanged: (String value) {
                                              setState(() {
                                                _currentCity = value;
                                              });
                                            },
                                            items: city.map((city) {
                                              return DropdownMenuItem(
                                                value: city,
                                                child: Text('$city'),
                                              );
                                            }).toList(),
                                            value: _currentCity,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Country'),
                                    Container(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          child:
                                              DropdownButtonFormField<String>(
                                            validator: (value) => value == null
                                                ? 'Your country is required'
                                                : null,
                                            isExpanded: true,
                                            onChanged: (String value) {
                                              setState(() {
                                                _currentCountry = value;
                                              });
                                            },
                                            items: country.map((country) {
                                              return DropdownMenuItem(
                                                value: country,
                                                child: Text('$country'),
                                              );
                                            }).toList(),
                                            value: _currentCountry,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: FlatButton(
                                    onPressed: () {
                                      print('cancel');
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.grey),
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    child: FlatButton(
                                      onPressed: () {
                                        print('save');
                                        if (_formKey.currentState.validate()) {
                                          print('ok');
                                        }
                                      },
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                      color: Colors.pink,
                                    ),
                                  ),
                                ),
                              ],
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
        ),
      ),
      viewModelBuilder: () => RegisterAsExpertViewModel(),
    );
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
