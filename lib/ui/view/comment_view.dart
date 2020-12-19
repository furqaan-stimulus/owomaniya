import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/comment_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class CommentView extends StatefulWidget {
  @override
  _CommentViewState createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  bool onChecked = false;
  bool isVisible = false;
  bool isProgress = false;

  Future<void> toggleVisibility() async {
    isVisible = !isVisible;
  }

  void isAnonymous() {
    setState(() {
      onChecked = !onChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommentViewModel>.reactive(
      builder: (context, model, child) => FutureBuilder(
          future: _getName(),
          builder: (context, spName) {
            if (spName.hasData) {
              return Container(
                child: Column(
                  children: [
                    Divider(color: Colors.grey),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Commenting as ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        onChecked
                            ? Text(
                                'Anonymous',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                spName.data,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 20,
                          child: Checkbox(
                            onChanged: (newValue) {
                              setState(() {
                                onChecked = !onChecked;
                              });
                            },
                            value: onChecked,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Anonymous',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: _getImage(),
                          builder: (context, spImage) {
                            if (spImage.hasData) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 6.0, top: 8.0),
                                child: onChecked
                                    ? SvgPicture.asset(
                                        'assets/svg/anyonmans.svg',
                                        height: 40,
                                      )
                                    : Image.network(
                                        spImage.data,
                                        width: 40.0,
                                        height: 40.0,
                                      ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(right: 6.0, top: 8.0),
                                child: SvgPicture.asset(
                                  'assets/svg/anyonmans.svg',
                                  height: 40,
                                ),
                              );
                            }
                          },
                        ),
                        Expanded(
                          child: Container(
                            width: 150,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Start typing your comment...',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: ClipOval(
                              child: Container(
                                color: Colors.grey,
                                height: 55,
                                width: 55,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/svg/send.svg',
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: isProgress,
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: SvgPicture.asset(
                            'assets/svg/anyonmans.svg',
                            height: 40,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mirza',
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'comment',
                              style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            } else {
              return Text("");
            }
          }),
      viewModelBuilder: () => CommentViewModel(),
    );
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
