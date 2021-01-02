import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/drawer_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
      builder: (context, model, child) => FutureBuilder(
        future: _getToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Drawer(
              child: ListView(
                children: [
                  Container(
                    height: 140.0,
                    child: DrawerHeader(
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: FutureBuilder(
                              future: _getImage(),
                              builder: (context, spImage) {
                                if (spImage.hasData) {
                                  return CircleAvatar(
                                    backgroundImage: NetworkImage(spImage.data),
                                    radius: 35,
                                  );
                                } else {
                                  return Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/svg/anyonmans.svg",
                                        width: 35,
                                        height: 35,
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                          FutureBuilder(
                            future: _getName(),
                            builder: (context, sp) {
                              if (sp.hasData) {
                                return Align(
                                  alignment: Alignment.topCenter + Alignment(0.3, 0),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30.0, bottom: 20.0),
                                    child: sp.data == null
                                        ? Text(
                                            'You',
                                            style: TextStyle(
                                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                                          )
                                        : Text(
                                            sp.data,
                                            style: TextStyle(
                                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                                          ),
                                  ),
                                );
                              } else {
                                return Text(' drawer ${sp.error}');
                              }
                            },
                          ),
                          Align(
                            alignment: Alignment.topCenter + Alignment(0, .3),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, top: 25.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    model.navigateToUserProfileView();
                                  });
                                },
                                child: Text(
                                  'View Profile',
                                  style: TextStyle(
                                      color: Colors.black, decoration: TextDecoration.underline, fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter + Alignment(0.5, 2.1),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 45.0, top: 25.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/sidebar_myconsul.svg'),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      model.navigateToMyConsultationView();
                                    },
                                    child: Text(
                                      'My Consultations',
                                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  SvgPicture.asset('assets/svg/sidebar_amount.svg'),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '\u20B9 0.00',
                                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.black12)),
                    ),
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_voice.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'Share Your Voice',
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          model.navigateToShareYourVoiceView();
                        });
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_query.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Ask a Query'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          model.navigateToQueryView();
                        });
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_test.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Book a Test'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_bookmarks.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Bookmarks'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          model.navigateToBookmarkView();
                        });
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_favourite.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Favorite Experts'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_consul.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Free Consultation'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_settings.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Settings'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_expert.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Join as Expert'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          model.navigateToRegisterAsExpertView();
                        });
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_about.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('About'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_logout.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Logout'),
                        ],
                      ),
                      onTap: () async {
                        Navigator.of(context).pop();
                        setState(() {
                          model.logout();
                        });
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          } else {
            // Without Login
            return Drawer(
              child: ListView(
                children: [
                  Container(
                    height: 80.0,
                    child: DrawerHeader(
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter + Alignment(0, 5),
                            child: Padding(
                                padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    model.navigateToLoginView();
                                  },
                                  child: Text(
                                    'Login/SignUp',
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.black12)),
                    ),
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_voice.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'Share Your Voice',
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          model.navigateToShareYourVoiceView();
                        });
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_query.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Ask a Query'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          model.navigateToQueryView();
                        });
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 40,
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          SvgPicture.asset('assets/svg/sidebar_test.svg'),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Book a Test'),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          }
        },
      ),
      viewModelBuilder: () => DrawerViewModel(),
    );
  }

  Future<String> _getToken() async {
    final SharedPreferences pref = await preferences;
    final String token = pref.getString("token");
    return token;
  }

  Future<String> _getName() async {
    final SharedPreferences pref = await preferences;
    final String fName = pref.getString("first_name");
    final String lName = pref.getString("last_name");
    final String fullname = '${fName + " " + lName}';
    return fullname;
  }

  Future<String> _getImage() async {
    final SharedPreferences pref = await preferences;
    final String image = pref.getString("user_image");
    return image;
  }
}
