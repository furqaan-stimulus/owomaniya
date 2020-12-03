import 'dart:core';
import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owomaniya/viewmodels/user_profile_view_model.dart';
import 'package:stacked/stacked.dart';

class UserProfileView extends StatefulWidget {
  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final _formKey = GlobalKey<FormState>();

  final List<String> gender = ['Male', 'Female'];
  String _currentGender = 'Male';
  final List<String> maritalStatus = ['Single', 'Married', 'In-Relationship'];
  String _currentMaritalStatus = 'Single';
  final List<String> city = [
    'Ahmedabad',
    'Mumbai',
    'Chennai',
    'Kolkata',
    'Pune',
    'Surat'
  ];
  String _currentCity = 'Ahmedabad';
  final List<String> country = ['USA', 'UK', 'India', 'Germany'];
  String _currentCountry = 'India';

  bool isEditable = false;
  bool isEditing = false;
  File _image;

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

  void toggleEdit() {
    setState(() {
      isEditing = !isEditing;
      isEditable = !isEditable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
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
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/basic_details.svg',
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Basic Details',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Visibility(
                                    visible: !isEditing,
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      child: FlatButton(
                                        onPressed: () {
                                          toggleEdit();
                                          print('clicked edit');
                                        },
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        color: Colors.pink,
                                      ),
                                    ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                              BorderRadius
                                                                  .circular(60),
                                                          child: Image.file(
                                                            _image,
                                                            width: 120,
                                                            height: 120,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        )
                                                      : Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                  child: Visibility(
                                                    visible: isEditing,
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
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/svg/profile_edit_icon.svg',
                                                              height: 20,
                                                              width: 20,
                                                            ),
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
                                              enabled: isEditable,
                                              decoration: InputDecoration(
                                                labelText: 'furqanbeg',
                                                hintText: 'First Name',
                                                hintStyle:
                                                    TextStyle(fontSize: 18.0),
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
                                              enabled: isEditable,
                                              decoration: InputDecoration(
                                                labelText: 'mirza',
                                                hintText: 'Last Name',
                                                hintStyle:
                                                    TextStyle(fontSize: 18.0),
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
                                      enabled: isEditable,
                                      decoration: InputDecoration(
                                        labelText: 'furqanmirza14@gmail.com',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Mobile Number*'),
                                          Container(
                                            width: 150,
                                            child: TextFormField(
                                              enabled: isEditable,
                                              decoration: InputDecoration(
                                                labelText: '1234567890',
                                                hintText: 'Mobile Number',
                                                hintStyle:
                                                    TextStyle(fontSize: 18.0),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Date of Birth'),
                                          SizedBox(
                                            height: 11.0,
                                          ),
                                          Container(
                                            width: 150,
                                            child: DateTimePicker(
                                              enabled: isEditable,
                                              type: DateTimePickerType.date,
                                              dateMask: 'dd-MM-yyyy',
                                              initialValue: '',
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100),
                                              onChanged: (val) {
                                                setState(() {});
                                              },
                                              validator: (val) {
                                                if (val.isEmpty) {
                                                  return 'Your date of birth is Empty';
                                                }
                                                return null;
                                              },
                                              onSaved: (val) {},
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Gender'),
                                          Container(
                                            width: 150,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                child: DropdownButton<String>(
                                                  underline: Container(
                                                    height: 1,
                                                    color: isEditable
                                                        ? Colors.pink
                                                        : Colors.grey,
                                                  ),
                                                  disabledHint: isEditable
                                                      ? Text(_currentGender)
                                                      : Text('select'),
                                                  isExpanded: true,
                                                  onChanged: isEditable
                                                      ? (String value) {
                                                          setState(() {
                                                            _currentGender =
                                                                value;
                                                          });
                                                        }
                                                      : null,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Marital Status'),
                                          Container(
                                            width: 150,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                child: DropdownButton<String>(
                                                  underline: Container(
                                                    height: 1,
                                                    color: isEditable
                                                        ? Colors.pink
                                                        : Colors.grey,
                                                  ),
                                                  disabledHint: isEditable
                                                      ? Text(
                                                          _currentMaritalStatus)
                                                      : Text('select'),
                                                  isExpanded: true,
                                                  onChanged: isEditable
                                                      ? (String value) {
                                                          setState(() {
                                                            _currentMaritalStatus =
                                                                value;
                                                          });
                                                        }
                                                      : null,
                                                  items: maritalStatus
                                                      .map((maritalStatus) {
                                                    return DropdownMenuItem(
                                                      value: maritalStatus,
                                                      child: Text(
                                                          '$maritalStatus'),
                                                    );
                                                  }).toList(),
                                                  value: _currentMaritalStatus,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('City'),
                                          Container(
                                            width: 150,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                child: DropdownButton<String>(
                                                  underline: Container(
                                                    height: 1,
                                                    color: isEditable
                                                        ? Colors.pink
                                                        : Colors.grey,
                                                  ),
                                                  disabledHint: isEditable
                                                      ? Text(_currentCity)
                                                      : Text('select'),
                                                  isExpanded: true,
                                                  onChanged: isEditable
                                                      ? (String value) {
                                                          setState(() {
                                                            _currentCity =
                                                                value;
                                                          });
                                                        }
                                                      : null,
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
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('Country'),
                                          Container(
                                            width: 150,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                child: DropdownButton<String>(
                                                  underline: Container(
                                                    height: 1,
                                                    color: isEditable
                                                        ? Colors.pink
                                                        : Colors.grey,
                                                  ),
                                                  disabledHint: isEditable
                                                      ? Text(_currentCountry)
                                                      : Text('select'),
                                                  isExpanded: true,
                                                  onChanged: isEditable
                                                      ? (String value) {
                                                          setState(() {
                                                            _currentCountry =
                                                                value;
                                                          });
                                                        }
                                                      : null,
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
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Visibility(
                                    visible: isEditing,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: FlatButton(
                                            onPressed: () {
                                              print('cancel');
                                              toggleEdit();
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
                                                toggleEdit();
                                                print('save');
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
        viewModelBuilder: () => UserProfileViewModel());
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
