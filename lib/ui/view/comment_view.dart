import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/comment_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:owomaniya/model/feed_comments.dart' as comment;

class CommentView extends StatefulWidget {
  final int feedId;

  const CommentView({Key key, this.feedId}) : super(key: key);

  @override
  _CommentViewState createState() => _CommentViewState(feedId);
}

class _CommentViewState extends State<CommentView> {
  final int feedId;

  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  bool onChecked = false;
  final commentController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  Future<List<comment.FeedComments>> commentList;

  _CommentViewState(this.feedId);

  void isAnonymous() {
    setState(() {
      onChecked = !onChecked;
    });
  }

  FocusNode commentFocus;
  FocusNode submitFocus;

  @override
  void initState() {
    super.initState();
    commentFocus = FocusNode();
    submitFocus = FocusNode();
  }

  @override
  void dispose() {
    commentFocus.dispose();
    submitFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<CommentViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(70.0),
            child: Text(
              "comment",
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            commentController.clear();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: _getName(),
              builder: (context, spName) {
                if (spName.hasData) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: width / 0.5,
                          height: height / 1.5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: FutureBuilder<List<comment.FeedComments>>(
                              future: model.getComments(feedId),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      print("image data: ${snapshot.data[index].user.userImage}");
                                      return Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 6.0),
                                            child: snapshot.data[index].isAnonymous == "Y"
                                                ? SvgPicture.asset(
                                                    "assets/svg/anyonmans.svg",
                                                    height: 40,
                                                  )
                                                : SvgPicture.network(
                                                    snapshot.data[index].user.userImage,
                                                    height: 40,
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              snapshot.data[index].isAnonymous == "Y"
                                                  ? Text(
                                                      "Anonymous",
                                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                                    )
                                                  : Text(
                                                      "${snapshot.data[index].user.firstName} ${snapshot.data[index].user.lastName}",
                                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                                    ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                snapshot.data[index].comment,
                                                style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Commenting as ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          onChecked
                              ? Text(
                                  'Anonymous',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              : Text(
                                  spName.data,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                          SizedBox(
                            width: 15.0,
                          ),
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
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: width / 0.5,
                          height: height / 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
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
                                      child: Form(
                                        key: _formKey,
                                        child: TextFormField(
                                          enabled: true,
                                          focusNode: commentFocus,
                                          onFieldSubmitted: (term) {
                                            commentFocus.unfocus();
                                            FocusScope.of(context).requestFocus(submitFocus);
                                          },
                                          controller: commentController,
                                          keyboardType: TextInputType.text,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'you can\'t post empty comment';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Start typing your comment...',
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red),
                                            ),
                                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.pink),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusManager.instance.primaryFocus.unfocus();
                                        commentController.clear();
                                        print("comment button pressed");
                                        if (_formKey.currentState.validate()) {
                                          // if (onChecked == false) {
                                          //   model.postFeedComment(itemHolder, commentController.text, "N");
                                          // } else {
                                          //   model.postFeedComment(itemHolder, commentController.text, "Y");
                                          // }
                                        }
                                      },
                                      child: ClipOval(
                                        child: Container(
                                          color: Colors.pink,
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
      viewModelBuilder: () => CommentViewModel(),
      onModelReady: (model) {
        commentList = model.getComments(feedId);
        print("feed id: $feedId");
      },
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
