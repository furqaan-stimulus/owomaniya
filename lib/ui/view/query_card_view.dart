import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/utils/date_time_ago.dart';
import 'package:owomaniya/viewmodels/query_card_view_model.dart';
import 'package:owomaniya/widget/popup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class QueryCardView extends StatefulWidget {
  @override
  _QueryCardViewState createState() => _QueryCardViewState();
}

class _QueryCardViewState extends State<QueryCardView> {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  bool descTextShowFlag = false;
  bool isProgress = false;
  bool onChecked = false;
  bool isVisible = false;

  List<Datum> feedList;

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
    return ViewModelBuilder<QueryCardViewModel>.reactive(
        builder: (context, model, child) => FutureBuilder(
              future: _getToken(),
              builder: (context, sptoken) {
                return ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: feedList?.length ?? 0,
                  itemBuilder: (context, first) {
                    return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: feedList[first].details.authordetails?.length ?? 0,
                      itemBuilder: (context, second) {
                        return ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: feedList[first].details.authordetails[second].user.authordetails?.length ?? 0,
                          itemBuilder: (context, third) {
                            return Card(
                              elevation: 5.0,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Query on ',
                                                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                                                  ),
                                                  Text(
                                                    '${feedList[first].categorymapping[second].category.category}',
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  feedList[first].feedqueryassigned[second].feedStatus == "ANSWERED"
                                                      ? Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/svg/check_pink.svg',
                                                              height: 15.0,
                                                              width: 15.0,
                                                            ),
                                                            SizedBox(
                                                              width: 5.0,
                                                            ),
                                                            Text(
                                                              'Answered',
                                                              style: TextStyle(fontSize: 14.0, color: Colors.pink),
                                                            ),
                                                          ],
                                                        )
                                                      : Text(''),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                DateTimeAgo.timeAgoSinceDate('${feedList[first].feedDate}'),
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: SvgPicture.asset(
                                              'assets/svg/icon.svg',
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${feedList[first].feedTitle}',
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              maxLines: 3,
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              child: GestureDetector(
                                                child: feedList[first].bookmarked == false
                                                    ? SvgPicture.asset(
                                                        "assets/svg/tag_inactive.svg",
                                                        width: 10.0,
                                                        height: 16.0,
                                                        key: ValueKey(feedList[first].bookmarked),
                                                      )
                                                    : SvgPicture.asset(
                                                        "assets/svg/tag_active.svg",
                                                        width: 10.0,
                                                        height: 16.0,
                                                        key: ValueKey(feedList[first].bookmarked),
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
                                                    if (feedList[first].bookmarked == false) {
                                                      model.postBookmark(feedList[first].id);
                                                      feedList[first].bookmarked = !feedList[first].bookmarked;
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          action: SnackBarAction(
                                                            label: 'Cancel',
                                                            onPressed: () {},
                                                          ),
                                                          content: Text('Bookmark Added'),
                                                        ),
                                                      );
                                                    } else {
                                                      model.postBookmark(feedList[first].id);
                                                      feedList[first].bookmarked = !feedList[first].bookmarked;
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          action: SnackBarAction(
                                                            label: 'Cancel',
                                                            onPressed: () {},
                                                          ),
                                                          content: Text('Bookmark removed'),
                                                        ),
                                                      );
                                                    }
                                                  }
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Text(
                                          '${feedList[first].feedDetail}',
                                          maxLines: descTextShowFlag ? 8 : 2,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              descTextShowFlag = !descTextShowFlag;
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            descTextShowFlag
                                                ? Text(
                                                    "Show Less",
                                                    style: TextStyle(color: Colors.grey),
                                                  )
                                                : Text("Continue Reading", style: TextStyle(color: Colors.grey))
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15.0),
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey, width: 0.5),
                                              borderRadius: BorderRadius.circular(3),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    feedList[first].details.authordetails[second].user.userImage == null
                                                        ? SvgPicture.asset(
                                                            'assets/svg/anyonmans.svg',
                                                            height: 40,
                                                            width: 40,
                                                          )
                                                        : Container(
                                                            height: 45.0,
                                                            width: 45.0,
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              image: DecorationImage(
                                                                fit: BoxFit.fill,
                                                                image: NetworkImage(
                                                                  feedList[first]
                                                                      .details
                                                                      .authordetails[second]
                                                                      .user
                                                                      .userImage,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8.0),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '${feedList[first].details.authordetails[second].user.firstName == null ? '' : feedList[first].details.authordetails[second].user.firstName}' +
                                                                ' ${feedList[first].details.authordetails[second].user?.lastName == null ? '' : feedList[first].details.authordetails[second].user?.lastName}',
                                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                                          ),
                                                          Text(
                                                            '${feedList[first].details.authordetails[second].user.expertexpertisemapping[second].parentexpertise.expertiseName == null ? '' : feedList[first].details.authordetails[second].user.expertexpertisemapping[second].parentexpertise.expertiseName}',
                                                            style: TextStyle(color: Colors.grey, fontSize: 12.0),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Divider(
                                                  color: Colors.grey,
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/svg/full_consultation.svg',
                                                        height: 14,
                                                        width: 14,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(top: 8.0),
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              model.navigateToAskFullConsultationView();
                                                            },
                                                            child: Text(
                                                              'See Full Consultation',
                                                              style: TextStyle(fontSize: 13.0),
                                                            )),
                                                      ),
                                                    ),
                                                    Container(height: 30, child: VerticalDivider(color: Colors.grey)),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/svg/sidebar_query.svg',
                                                        height: 14,
                                                        width: 14,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          var fName = feedList[first]
                                                              .details
                                                              .authordetails[second]
                                                              .user
                                                              .firstName;
                                                          var lName = feedList[first]
                                                              .details
                                                              .authordetails[second]
                                                              .user
                                                              .lastName;
                                                          var fullName = fName + lName;
                                                          var expertName = feedList[first]
                                                              .details
                                                              .authordetails[second]
                                                              .user
                                                              .expertexpertisemapping[second]
                                                              .parentexpertise
                                                              .expertiseName;
                                                          model.navigateToAskExpertView(fullName, expertName);
                                                        },
                                                        child: Text(
                                                          'Ask ${feedList[first].details.authordetails[second].user.firstName} ${feedList[first].details.authordetails[second].user.lastName}',
                                                          style: TextStyle(fontSize: 13.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: 15,
                                            top: -1.0,
                                            child: Container(
                                              padding: EdgeInsets.only(left: 10, right: 10),
                                              color: Colors.white,
                                              child: Text(
                                                'Expert Says',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text('${feedList[first].feedRelateCnt} Relate with this'),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                            child: Text('.'),
                                          ),
                                          Text('${feedList[first].feedCommentCnt} Comment'),
                                        ],
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
                                              key: UniqueKey(),
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
                                                  if (feedList[first].relate == false) {
                                                    model.relateQuery(feedList[first].id);
                                                    feedList[first].relate = !feedList[first].relate;
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        action: SnackBarAction(
                                                          label: 'Cancel',
                                                          onPressed: () {},
                                                        ),
                                                        content: Text('Relate'),
                                                      ),
                                                    );
                                                    print("if");
                                                  } else {
                                                    model.relateQuery(feedList[first].id);
                                                    feedList[first].relate = !feedList[first].relate;
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        action: SnackBarAction(
                                                          label: 'Cancel',
                                                          onPressed: () {},
                                                        ),
                                                        content: Text('Relate removed'),
                                                      ),
                                                    );
                                                    print("else");
                                                  }
                                                }
                                              },
                                              child: Row(
                                                children: [
                                                  feedList[first].relate == false
                                                      ? SvgPicture.asset(
                                                          'assets/svg/relate_hand.svg',
                                                          height: 20,
                                                          width: 20,
                                                        )
                                                      : SvgPicture.asset(
                                                          'assets/svg/relate_hand_pink.svg',
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    'I Relate',
                                                    style: TextStyle(
                                                        color: feedList[first].relate == false
                                                            ? Colors.black
                                                            : Colors.pink),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
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
                                                  toggleVisibility();
                                                });
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/svg/comment.svg',
                                                    height: 20,
                                                    width: 20,
                                                    color: isVisible == false ? Colors.black : Colors.pink,
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    'Comment',
                                                    style: TextStyle(
                                                      color: isVisible == false ? Colors.black : Colors.pink,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          PopupView(),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
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
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderSide: BorderSide(color: Colors.pink))),
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
              },
            ),
        viewModelBuilder: () => QueryCardViewModel());
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
