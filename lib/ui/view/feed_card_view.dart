import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/utils/date_time_ago.dart';
import 'package:owomaniya/viewmodels/feed_card_view_model.dart';
import 'package:owomaniya/widget/popup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class FeedCardView extends StatefulWidget {
  @override
  _FeedCardViewState createState() => _FeedCardViewState();
}

class _FeedCardViewState extends State<FeedCardView> {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  bool descTextShowFlag = false;
  bool isProgress = false;
  bool onChecked = false;
  bool isVisible = false;
  final commentController = TextEditingController();

  Future<void> toggleVisibility(BuildContext context, int index) async {
    isVisible = !isVisible;
  }

  void isAnonymous() {
    setState(() {
      onChecked = !onChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedCardViewModel>.reactive(
        builder: (context, model, child) => FutureBuilder(
              future: _getToken(),
              builder: (context, sptoken) {
                return FutureBuilder<FeedItemModel>(
                  future: model.loadFeed(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.data?.length ?? 0,
                        itemBuilder: (context, first) {
                          return ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.data[first].details.authordetails?.length ?? 0,
                            itemBuilder: (context, second) {
                              return ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot
                                        .data.data[first].details.authordetails[second].user.authordetails?.length ??
                                    0,
                                itemBuilder: (context, third) {
                                  return Card(
                                    elevation: 5.0,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                snapshot.data.data[first].details.authordetails[second].user
                                                            .userImage ==
                                                        null
                                                    ? SvgPicture.asset(
                                                        'assets/svg/anyonmans.svg',
                                                        height: 50,
                                                        width: 50,
                                                      )
                                                    : Container(
                                                        height: 50.0,
                                                        width: 50.0,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                              snapshot.data.data[first].details.authordetails[second]
                                                                  .user.userImage,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '${snapshot.data.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data.data[first].details.authordetails[second].user.firstName}' +
                                                            ' ${snapshot.data.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data.data[first].details.authordetails[second].user?.lastName}',
                                                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(
                                                        '${snapshot.data.data[first].details.authordetails[second].user.authordetails[third].introduction}',
                                                        softWrap: true,
                                                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                      ),
                                                      Text(
                                                        DateTimeAgo.timeAgoSinceDate(
                                                            '${snapshot.data.data[first].feedDate}'),
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // model.navigateToVoicesView();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 250.0,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.rectangle,
                                                        image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                            snapshot.data.data[first].media[second].mediaPath,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // Image.network(snapshot.data.data[first].media[second].mediaPath),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            '${snapshot.data.data[first].categorymapping[second].category.category}',
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 20,
                                                            child: GestureDetector(
                                                              child: snapshot.data.data[first].bookmarked == false
                                                                  ? SvgPicture.asset(
                                                                      "assets/svg/tag_inactive.svg",
                                                                      width: 10.0,
                                                                      height: 16.0,
                                                                    )
                                                                  : SvgPicture.asset(
                                                                      "assets/svg/tag_active.svg",
                                                                      width: 10.0,
                                                                      height: 16.0,
                                                                    ),
                                                              onTap: () {
                                                                if (sptoken.data == null) {
                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                    SnackBar(
                                                                      action: SnackBarAction(
                                                                        label: 'Undo',
                                                                        onPressed: () {},
                                                                      ),
                                                                      content: Text('You are not Login'),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  if (snapshot.data.data[first].bookmarked == false) {
                                                                    model.postBookmark(snapshot.data.data[first].id);
                                                                    snapshot.data.data[first].bookmarked =
                                                                        !snapshot.data.data[first].bookmarked;
                                                                    print("if");
                                                                  } else {
                                                                    model.postBookmark(snapshot.data.data[first].id);
                                                                    snapshot.data.data[first].bookmarked =
                                                                        !snapshot.data.data[first].bookmarked;
                                                                    print("else");
                                                                  }
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                                                      child: Text(
                                                        '${snapshot.data.data[first].feedTitle}',
                                                        textAlign: TextAlign.left,
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    ' ${snapshot.data.data[first].feedLikeCnt} like this',
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                                    child: Text(
                                                      '.',
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data.data[first].feedCommentCnt} comments',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      if (sptoken.data == null) {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            action: SnackBarAction(
                                                              label: 'Undo',
                                                              onPressed: () {},
                                                            ),
                                                            content: Text('You are not Login'),
                                                          ),
                                                        );
                                                      } else {
                                                        if (snapshot.data.data[first].liked == false) {
                                                          model.likeArticle(snapshot.data.data[first].id);
                                                          snapshot.data.data[first].liked =
                                                              !snapshot.data.data[first].liked;
                                                        } else {
                                                          model.likeArticle(snapshot.data.data[first].id);
                                                          snapshot.data.data[first].liked =
                                                              !snapshot.data.data[first].liked;
                                                        }
                                                      }
                                                    },
                                                    child: Row(
                                                      children: [
                                                        snapshot.data.data[first].liked == false
                                                            ? SvgPicture.asset(
                                                                'assets/svg/like_gray.svg',
                                                                height: 20,
                                                                width: 20,
                                                              )
                                                            : SvgPicture.asset(
                                                                'assets/svg/like_pink.svg',
                                                                height: 20,
                                                                width: 20,
                                                              ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          'Like',
                                                          style: TextStyle(
                                                            color: snapshot.data.data[first].liked == false
                                                                ? Colors.black
                                                                : Colors.pink,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10.0),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      if (sptoken.data == null) {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            action: SnackBarAction(
                                                              label: 'Undo',
                                                              onPressed: () {},
                                                            ),
                                                            content: Text('You are not Login'),
                                                          ),
                                                        );
                                                      } else {
                                                        setState(() {
                                                          toggleVisibility(context, snapshot.data.data[first].id);
                                                        });
                                                      }
                                                    },
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/svg/comment.svg',
                                                          height: 20,
                                                          width: 20,
                                                          color: isVisible ? Colors.pink : Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          'Comment',
                                                          style: TextStyle(
                                                            color: isVisible ? Colors.pink : Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                PopupView(),
                                              ],
                                            ),
                                            Visibility(
                                              visible: isVisible,
                                              child: FutureBuilder(
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
                                                                        padding:
                                                                            const EdgeInsets.only(right: 6.0, top: 8.0),
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
                                                                        padding:
                                                                            const EdgeInsets.only(right: 6.0, top: 8.0),
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
                                                                      controller: commentController,
                                                                      decoration: InputDecoration(
                                                                        hintText: 'Start typing your comment...',
                                                                        enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.grey),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(color: Colors.pink),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 6.0),
                                                                  child: GestureDetector(
                                                                    onTap: () {
                                                                      print('${snapshot.data.data[first].id}');
                                                                      if (onChecked == false) {
                                                                        model.postFeedComment(
                                                                            snapshot.data.data[first].id,
                                                                            commentController.text,
                                                                            "N");
                                                                      } else {
                                                                        model.postFeedComment(
                                                                            snapshot.data.data[first].id,
                                                                            commentController.text,
                                                                            "Y");
                                                                      }
                                                                    },
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
                                                                      style:
                                                                          TextStyle(color: Colors.black, fontSize: 16),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5.0,
                                                                    ),
                                                                    Text(
                                                                      'comment',
                                                                      style: TextStyle(
                                                                          color: Colors.blueGrey, fontSize: 14),
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
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
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
              },
            ),
        viewModelBuilder: () => FeedCardViewModel());
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
