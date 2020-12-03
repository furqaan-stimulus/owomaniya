import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:owomaniya/model/users.dart';
import 'package:owomaniya/owPreferences/user_preferences.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<FeedItemModel> feedItem;
  List feedList;
  bool _visible = false;
  Users user;

  ScrollController scrollController = ScrollController(
    initialScrollOffset: 10, // or whatever offset you wish
    keepScrollOffset: true,
  );

  void changeVisibility() {
    if (UserPreferences().saveUser(user) != null) {
      setState(() {
        _visible = true;
      });
      print('pref ${user.emailAddress}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image(
              image: AssetImage('assets/images/oowomaniya_logo.png'),
              height: 150,
              width: 150,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: newList == null ?0:newList.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(newList[index]["feed_type"]),);
          },
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              Visibility(
                visible: _visible,
                child: Container(
                  height: 140.0,
                  child: DrawerHeader(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/onboarding0.png'),
                                radius: 35,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter + Alignment(0, 0),
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0, bottom: 20.0),
                            child: Text(
                              'Mirza Furqaan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter + Alignment(0, .3),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 25.0),
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
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter + Alignment(0.5, 2.1),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 45.0, top: 25.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/svg/sidebar_myconsul.svg'),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'My Consultations',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                                SizedBox(width: 10.0),
                                SvgPicture.asset(
                                    'assets/svg/sidebar_amount.svg'),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '\u20B9 0.00',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: Colors.black12)),
                  ),
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
                    setState(() {
                      model.navigateToPaymentMethodView();
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
                child: Visibility(
                  visible: _visible,
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
              ),
              Visibility(
                visible: _visible,
                child: Divider(
                  indent: 10.0,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 40,
                child: Visibility(
                  visible: _visible,
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
              ),
              Visibility(
                visible: _visible,
                child: Divider(
                  indent: 10.0,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 40,
                child: Visibility(
                  visible: _visible,
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
              ),
              Visibility(
                visible: _visible,
                child: Divider(
                  indent: 10.0,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 40,
                child: Visibility(
                  visible: _visible,
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
              ),
              Visibility(
                visible: _visible,
                child: Divider(
                  indent: 10.0,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 40,
                child: Visibility(
                  visible: _visible,
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
              ),
              Visibility(
                visible: _visible,
                child: Divider(
                  indent: 10.0,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 40,
                child: Visibility(
                  visible: _visible,
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
              ),
              Visibility(
                visible: _visible,
                child: Divider(
                  indent: 10.0,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 40,
                child: Visibility(
                  visible: _visible,
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
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        model.logout();
                      });
                    },
                  ),
                ),
              ),
              Visibility(
                visible: _visible,
                child: Divider(
                  indent: 10.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) async {
        getFeedItem();
      },
    );
  }

  List newList;



  Future<String> getFeedItem() async {
    final response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL);

    setState(() {
      var jsonData = json.decode(response.body);
      newList = jsonData["data"];
    });

    // _list.add(jsonData["data"]);

    // print('list ${_list[0]["feed_type"]}');
    // print(
    //     'list ${_list[0]["details"]["authordetails"][0]["user"]["first_name"]}');
    // print(
    //     'list ${_list[0]["details"]["authordetails"][0]["user"]["last_name"]}');

    // if (response.statusCode == 200) {
    //   var top = jsonData;
    //   var data = jsonData["data"];
    //   var data1 = jsonData["status"];
    //   var data2 = jsonData["meta"];
    //   var data3 = jsonData["links"];
    //
    //   print(" top --$top");
    //   print(" data --$data");
    //   print(" data1 --$data1");
    //   print(" data2 --$data2");
    //   print(" data3 --$data3");
    // }
  }
}
