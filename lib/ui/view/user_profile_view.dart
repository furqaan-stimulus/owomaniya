import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:owomaniya/model/user_profile.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/user_profile_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class UserProfileView extends StatefulWidget {
  final UserProfile profile;
  final TextEditingController firstNameController;

  final TextEditingController lastNameController;

  final TextEditingController mobileController;

  final TextEditingController emailController;

  const UserProfileView(
      {Key key,
      this.profile,
      this.firstNameController,
      this.lastNameController,
      this.mobileController,
      this.emailController})
      : super(key: key);

  @override
  _UserProfileViewState createState() => _UserProfileViewState(
      profile, emailController, firstNameController, lastNameController, mobileController);
}

class _UserProfileViewState extends State<UserProfileView> {
  final _formKey = GlobalKey<FormState>();

  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController firstNameController;

  final TextEditingController lastNameController;

  final TextEditingController mobileController;

  final TextEditingController emailController;

  final UserProfile profile;

  _UserProfileViewState(this.profile, this.lastNameController, this.mobileController,
      this.emailController, this.firstNameController);

  FocusNode fName;
  FocusNode lName;
  FocusNode dob;
  FocusNode genderFocus;
  FocusNode emailFocus;
  FocusNode mNumber;
  FocusNode submitFocus;

  final List<String> gender = ['Male', 'Female'];
  String _currentGender = 'Male';

  final List<String> maritalStatus = ['Single', 'Married', 'In-Relationship'];
  String _currentMaritalStatus = 'Single';
  final List<String> city = ['Ahmedabad', 'Mumbai', 'Chennai', 'Kolkata', 'Pune', 'Surat'];
  String _currentCity = 'Ahmedabad';
  final List<String> country = ['USA', 'UK', 'India', 'Germany'];
  String _currentCountry = 'India';
  String _birthDate;

  var now = DateTime.now();
  ValueNotifier<DateTime> _dateTimeNotifier =
      ValueNotifier<DateTime>(Jiffy(DateTime.now()).subtract(years: 13));

  bool isEditable = false;
  bool isEditing = false;
  File _image;

  _imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);

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
  void initState() {
    super.initState();
    fName = FocusNode();
    lName = FocusNode();
    dob = FocusNode();
    genderFocus = FocusNode();
    emailFocus = FocusNode();
    mNumber = FocusNode();
    submitFocus = FocusNode();
  }

  @override
  void dispose() {
    fName.dispose();
    lName.dispose();
    genderFocus.dispose();
    dob.dispose();
    emailFocus.dispose();
    mNumber.dispose();
    submitFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Basic Details',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/svg/basic_details.svg',
            ),
          ),
          actions: [
            Visibility(
              visible: !isEditing,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                child: Container(
                  height: 30,
                  width: 80,
                  child: FlatButton(
                    onPressed: () {
                      toggleEdit();
                      print('clicked edit');
                    },
                    child: Text(
                      'Edit',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                    ),
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          ],
        ),
        key: _scaffoldKey,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Wrap(
                    runSpacing: 10.0,
                    children: [
                      FutureBuilder<UserProfile>(
                        future: _getUserProfile(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return FutureBuilder(
                              future: _getUserId(),
                              builder: (context, spId) {
                                if (spId.hasData) {
                                  return Container(
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
                                                                      BorderRadius.circular(60),
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
                                                                        BorderRadius.circular(60),
                                                                  ),
                                                                  width: 100,
                                                                  height: 100,
                                                                  child: Image.network(
                                                                      '${snapshot.data.data.userImage}'),
                                                                ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          right: 18,
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
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('First Name*'),
                                                    TextFormField(
                                                      key: Key(snapshot.data.data.firstName),
                                                      keyboardType: TextInputType.name,
                                                      controller: firstNameController,
                                                      enabled: isEditable,
                                                      focusNode: fName,
                                                      initialValue: snapshot.data.data.firstName,
                                                      onFieldSubmitted: (term) {
                                                        fName.unfocus();
                                                        FocusScope.of(context).requestFocus(lName);
                                                      },
                                                      decoration: InputDecoration(
                                                        hintText: 'First Name',
                                                        hintStyle: TextStyle(fontSize: 18.0),
                                                      ),
                                                      onChanged: (value) {},
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
                                                      key: Key(snapshot.data.data.lastName),
                                                      enabled: isEditable,
                                                      controller: lastNameController,
                                                      focusNode: lName,
                                                      onFieldSubmitted: (term) {
                                                        lName.unfocus();
                                                        FocusScope.of(context)
                                                            .requestFocus(emailFocus);
                                                      },
                                                      initialValue: snapshot.data.data.lastName,
                                                      onChanged: (value) {},
                                                      keyboardType: TextInputType.name,
                                                      decoration: InputDecoration(
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
                                              key: Key(snapshot.data.data.emailAddress),
                                              focusNode: emailFocus,
                                              keyboardType: TextInputType.emailAddress,
                                              enabled: isEditable,
                                              controller: emailController,
                                              initialValue: snapshot.data.data.emailAddress,
                                              onFieldSubmitted: (term) {
                                                emailFocus.unfocus();
                                                FocusScope.of(context).requestFocus(mNumber);
                                              },
                                              onChanged: (value) {},
                                              decoration: InputDecoration(
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
                                                      key: Key(snapshot.data.data.mobileNo),
                                                      enabled: isEditable,
                                                      focusNode: mNumber,
                                                      controller: mobileController,
                                                      keyboardType: TextInputType.phone,
                                                      initialValue: snapshot.data.data.mobileNo,
                                                      onFieldSubmitted: (term) {
                                                        mNumber.unfocus();
                                                        FocusScope.of(context).requestFocus(dob);
                                                      },
                                                      decoration: InputDecoration(
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
                                                  Container(
                                                    width: 150,
                                                    child: DateTimePicker(
                                                      key: Key("${snapshot.data.data.dateOfBirth}"),
                                                      enabled: isEditable,
                                                      focusNode: dob,
                                                      type: DateTimePickerType.date,
                                                      dateMask: 'dd-MM-yyyy',
                                                      initialValue:
                                                          "${snapshot.data.data.dateOfBirth}",
                                                      firstDate: DateTime(1900),
                                                      lastDate: _dateTimeNotifier.value,
                                                      onFieldSubmitted: (term) {
                                                        dob.unfocus();
                                                        FocusScope.of(context)
                                                            .requestFocus(genderFocus);
                                                      },
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
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: Container(
                                                        child: DropdownButton<String>(
                                                          key: Key(snapshot.data.data.gender),
                                                          focusNode: genderFocus,
                                                          underline: Container(
                                                            height: 1,
                                                            color: isEditable
                                                                ? Colors.grey
                                                                : Colors.grey,
                                                          ),
                                                          disabledHint: isEditable
                                                              ? Text(_currentGender)
                                                              : Text(snapshot.data.data.gender),
                                                          isExpanded: true,
                                                          onChanged: isEditable
                                                              ? (String value) {
                                                                  setState(() {
                                                                    _currentGender = value;
                                                                  });
                                                                }
                                                              : null,
                                                          items: gender.map((gender) {
                                                            return DropdownMenuItem(
                                                              value: gender,
                                                              child: Text('$gender',style: TextStyle(color: Colors.black),),
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
                                                  Text('Marital Status'),
                                                  Container(
                                                    width: 150,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: Container(
                                                        child: DropdownButton<String>(
                                                          key:
                                                              Key(snapshot.data.data.maritalStatus),
                                                          underline: Container(
                                                            height: 1,
                                                            color: isEditable
                                                                ? Colors.grey
                                                                : Colors.grey,
                                                          ),
                                                          disabledHint: isEditable
                                                              ? Text(_currentMaritalStatus)
                                                              : Text(
                                                                  snapshot.data.data.maritalStatus),
                                                          isExpanded: true,
                                                          onChanged: isEditable
                                                              ? (String value) {
                                                                  setState(() {
                                                                    _currentMaritalStatus = value;
                                                                  });
                                                                }
                                                              : null,
                                                          items: maritalStatus.map((maritalStatus) {
                                                            return DropdownMenuItem(
                                                              value: maritalStatus,
                                                              child: Text('$maritalStatus',style: TextStyle(color: Colors.black),),
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('City'),
                                                  Container(
                                                    width: 150,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: Container(
                                                        child: DropdownButton<String>(
                                                          key: Key(snapshot.data.data.city),
                                                          underline: Container(
                                                            height: 1,
                                                            color: isEditable
                                                                ? Colors.grey
                                                                : Colors.grey,
                                                          ),
                                                          disabledHint: isEditable
                                                              ? Text(_currentCity)
                                                              : Text(snapshot.data.data.city),
                                                          isExpanded: true,
                                                          onChanged: isEditable
                                                              ? (String value) {
                                                                  setState(() {
                                                                    _currentCity = value;
                                                                  });
                                                                }
                                                              : null,
                                                          items: city.map((city) {
                                                            return DropdownMenuItem(
                                                              value: city,
                                                              child: Text('$city',style: TextStyle(color: Colors.black),),
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Country'),
                                                  Container(
                                                    width: 150,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: Container(
                                                        child: DropdownButton<String>(
                                                          key: Key(snapshot.data.data.country),
                                                          underline: Container(
                                                            height: 1,
                                                            color: isEditable
                                                                ? Colors.grey
                                                                : Colors.grey,
                                                          ),
                                                          disabledHint: isEditable
                                                              ? Text(_currentCountry)
                                                              : Text(snapshot.data.data.country),
                                                          isExpanded: true,
                                                          onChanged: isEditable
                                                              ? (String value) {
                                                                  setState(() {
                                                                    _currentCountry = value;
                                                                  });
                                                                }
                                                              : null,
                                                          items: country.map((country) {
                                                            return DropdownMenuItem(
                                                              value: country,
                                                              child: Text('$country',style: TextStyle(color: Colors.black),),
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
                                                      border: Border.all(color: Colors.grey)),
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
                                                      focusNode: submitFocus,
                                                      onPressed: () {
                                                        toggleEdit();
                                                        print('save');
                                                        // model.postUserProfile(
                                                        //     emailController.text,
                                                        //     mobileController.text,
                                                        //     _birthDate,
                                                        //     _currentGender,
                                                        //     _currentCity,
                                                        //     _currentCountry,
                                                        //     _currentMaritalStatus,
                                                        //     firstNameController.text,
                                                        //     lastNameController.text);
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
                                  );
                                } else {
                                  return Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Loading..'),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: LinearProgressIndicator(),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            return Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Loading..'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: LinearProgressIndicator(),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => UserProfileViewModel(),
      onModelReady: (model) {
        _getUserProfile();
      },
    );
  }

  Future<UserProfile> _getUserProfile() async {
    final SharedPreferences pref = await preferences;
    var token = pref.getString("token");
    final response = await http.get(
      ApiUrls.GET_USER_PROFILE_URL + token,
    );
    final jsonString = json.decode(response.body);
    var result;
    if (response.statusCode == 200) {
      UserProfile model = UserProfile.fromJson(jsonString);
      return model;
    } else {
      result = {'status': false, 'message': 'code ${response.body}'};
      print(result);
      throw Exception('Failed to load');
    }
  }

  Future<int> _getUserId() async {
    final SharedPreferences pref = await preferences;
    final int uId = pref.getInt("user_id");
    return uId;
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
