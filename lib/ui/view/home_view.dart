import 'package:owomaniya/Enums/feed_type.dart';
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/utils/date_time_ago.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/home_view_model.dart';
import 'package:owomaniya/widget/popup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool onChecked = false;
  bool isVisible = false;
  bool isProgress = false;
  bool isBookmark = false;
  bool isLiked = false;
  bool isRelate = false;
  bool descTextShowFlag = false;

  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  void toggleBookmark() {
    setState(() {
      isBookmark = !isBookmark;
    });
  }

  void toggleLike() {
    setState(() {
      isRelate = !isRelate;
    });
  }

  void toggleRelate() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  Future<void> toggleVisibility() async {
    isVisible = !isVisible;
  }

  void isProgressing() {
    setState(() {
      isProgress = !isProgress;
    });
  }

  void isAnonymous() {
    setState(() {
      onChecked = !onChecked;
    });
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
        body: FutureBuilder(
          future: _getToken(),
          builder: (context, sptoken) {
            if (sptoken.hasData) {
              return FutureBuilder<FeedItemModel>(
                future: model.loadFeed(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.data?.length ?? 0,
                      itemBuilder: (context, first) {
                        return ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.data[first].details.authordetails?.length ?? 0,
                          itemBuilder: (context, second) {
                            if (snapshot.data.data[first].feedType == FeedType.QUERY) {
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
                                                      'Query on ${snapshot.data.data[first].categorymapping[second].category.category}',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    snapshot
                                                                .data
                                                                .data[first]
                                                                .feedqueryassigned[second]
                                                                .feedStatus ==
                                                            "ANSWERED"
                                                        ? Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/svg/check_pink.svg',
                                                                height: 15.0,
                                                                width: 15.0,
                                                              ),
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                              Text(
                                                                'Answered',
                                                                style: TextStyle(
                                                                    fontSize: 16.0,
                                                                    color: Colors.pink),
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
                                                  DateTimeAgo.timeAgoSinceDate(
                                                      '${snapshot.data.data[first].feedDate}'),
                                                  style: TextStyle(
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                              child: SvgPicture.asset('assets/svg/icon.svg'),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${snapshot.data.data[first].feedTitle}',
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false,
                                                maxLines: 3,
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 10.0, right: 10.0),
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                child: GestureDetector(
                                                  child: isBookmark == false
                                                      ? SvgPicture.asset(
                                                          "assets/svg/tag_inactive.svg")
                                                      : SvgPicture.asset(
                                                          "assets/svg/tag_active.svg"),
                                                  onTap: () {
                                                    if (sptoken.data == null) {
                                                      Scaffold.of(context).showSnackBar(
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
                                                        // toggleBookmark();
                                                      });
                                                    }
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 5.0),
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 10.0),
                                          child: Text(
                                            '${snapshot.data.data[first].feedDetail}',
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
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 14.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                descTextShowFlag
                                                    ? Text(
                                                        "Show Less",
                                                        style: TextStyle(color: Colors.grey),
                                                      )
                                                    : Text("Continue Reading",
                                                        style: TextStyle(color: Colors.grey))
                                              ],
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey, width: 0.5),
                                                borderRadius: BorderRadius.circular(5),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      snapshot
                                                                  .data
                                                                  .data[first]
                                                                  .details
                                                                  .authordetails[second]
                                                                  .user
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
                                                                    snapshot
                                                                        .data
                                                                        .data[first]
                                                                        .details
                                                                        .authordetails[second]
                                                                        .user
                                                                        .userImage,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            left: 8.0, top: 10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              '${snapshot.data.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data.data[first].details.authordetails[second].user.firstName}' +
                                                                  ' ${snapshot.data.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data.data[first].details.authordetails[second].user?.lastName}',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 18),
                                                            ),
                                                            Text(
                                                                '${snapshot.data.data[first].details.authordetails[second].user.expertexpertisemapping[0].parentexpertise.expertiseName == null ? '' : snapshot.data.data[first].details.authordetails[second].user.expertexpertisemapping[second].parentexpertise.expertiseName}'),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    color: Colors.grey,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/svg/full_consultation.svg',
                                                        height: 15,
                                                        width: 15,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                          child: GestureDetector(
                                                              onTap: () {},
                                                              child:
                                                                  Text('See Full Consultation'))),
                                                      Container(
                                                          height: 30,
                                                          child:
                                                              VerticalDivider(color: Colors.grey)),
                                                      SvgPicture.asset(
                                                        'assets/svg/sidebar_query.svg',
                                                        height: 18,
                                                        width: 18,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {},
                                                          child: Text(
                                                              'Ask ${snapshot.data.data[first].details.authordetails[second].user.firstName + snapshot.data.data[first].details.authordetails[second].user.lastName}'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 20,
                                              top: 2,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 5, left: 10, right: 10),
                                                color: Colors.white,
                                                child: Text(
                                                  'Expert Says',
                                                  style:
                                                      TextStyle(color: Colors.black, fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  '${snapshot.data.data[first].feedRelateCnt} Relate with this'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 8.0, right: 8.0),
                                                child: Text('.'),
                                              ),
                                              Text(
                                                  '${snapshot.data.data[first].feedCommentCnt} Comment'),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                child: Row(
                                                  children: [
                                                    isRelate == false
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
                                                    GestureDetector(
                                                      child: Text(
                                                        'I Relate',
                                                      ),
                                                      onTap: () async {
                                                        if (sptoken.data == null) {
                                                          Scaffold.of(context).showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Undo',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('You are not Login'),
                                                            ),
                                                          );
                                                        } else {}
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  if (sptoken.data == null) {
                                                    Scaffold.of(context).showSnackBar(
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
                                                  padding: const EdgeInsets.only(top: 12.0),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/svg/comment.svg',
                                                        height: 20,
                                                        width: 20,
                                                        color: isVisible == false
                                                            ? Colors.black
                                                            : Colors.pink,
                                                      ),
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Text(
                                                        'Comment',
                                                        style: TextStyle(
                                                          color: isVisible == false
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
                                              PopupView(),
                                            ],
                                          ),
                                        ),
                                        FutureBuilder(
                                            future: _getName(),
                                            builder: (context, spName) {
                                              if (spName.hasData) {
                                                return Visibility(
                                                    visible: isVisible,
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          Divider(color: Colors.grey),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.start,
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
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                            children: [
                                                              FutureBuilder(
                                                                future: _getImage(),
                                                                builder: (context, spImage) {
                                                                  if (spImage.hasData) {
                                                                    return Padding(
                                                                      padding:
                                                                          const EdgeInsets.only(
                                                                              right: 6.0, top: 8.0),
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
                                                                          const EdgeInsets.only(
                                                                              right: 6.0, top: 8.0),
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
                                                                        hintText:
                                                                            'Start typing your comment...',
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.grey),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                                borderSide:
                                                                                    BorderSide(
                                                                                        color: Colors
                                                                                            .pink))),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(
                                                                    left: 6.0),
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
                                                                padding: const EdgeInsets.only(
                                                                    right: 6.0),
                                                                child: SvgPicture.asset(
                                                                  'assets/svg/anyonmans.svg',
                                                                  height: 40,
                                                                ),
                                                              ),
                                                              // SizedBox(
                                                              //   width: 5.0,
                                                              // ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment.start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Mirza',
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 16),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5.0,
                                                                  ),
                                                                  Text(
                                                                    'comment',
                                                                    style: TextStyle(
                                                                        color: Colors.blueGrey,
                                                                        fontSize: 14),
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
                                                          // GestureDetector(
                                                          //   child: Text('load more'),
                                                          //   onTap: isProgressing,
                                                          // ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ));
                                              } else {
                                                return Text('${spName.error}');
                                              }
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
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
                                            snapshot.data.data[first].details.authordetails[second]
                                                        .user.userImage ==
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
                                                          snapshot.data.data[first].details
                                                              .authordetails[second].user.userImage,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${snapshot.data.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data.data[first].details.authordetails[second].user.firstName}' +
                                                      ' ${snapshot.data.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data.data[first].details.authordetails[second].user?.lastName}',
                                                  style: TextStyle(
                                                      fontSize: 18.0, fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  '${snapshot.data.data[first].details.authordetails[second].user.authordetails[second].introduction}',
                                                  softWrap: true,
                                                  style:
                                                      TextStyle(fontSize: 11.0, color: Colors.grey),
                                                ),
                                                Text(
                                                  DateTimeAgo.timeAgoSinceDate(
                                                      '${snapshot.data.data[first].feedDate}'),
                                                  style: TextStyle(
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ],
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
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey)),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 250.0,
                                                  width: 330.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        snapshot.data.data[first].media[second]
                                                            .mediaPath,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Image.network(snapshot.data.data[first].media[second].mediaPath),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${snapshot.data.data[first].categorymapping[second].category.category}',
                                                      ),
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        child: GestureDetector(
                                                          child: isBookmark == false
                                                              ? SvgPicture.asset(
                                                                  "assets/svg/tag_inactive.svg")
                                                              : SvgPicture.asset(
                                                                  "assets/svg/tag_active.svg"),
                                                          onTap: () {
                                                            if (sptoken.data == null) {
                                                              Scaffold.of(context).showSnackBar(
                                                                SnackBar(
                                                                  action: SnackBarAction(
                                                                    label: 'Undo',
                                                                    onPressed: () {},
                                                                  ),
                                                                  content:
                                                                      Text('You are not Login'),
                                                                ),
                                                              );
                                                            } else {
                                                              setState(() {
                                                                // toggleBookmark();
                                                              });
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(10.0),
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
                                        SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                ' ${snapshot.data.data[first].feedLikeCnt} like',
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 8.0, right: 8.0),
                                                child: Text('.'),
                                              ),
                                              Text(
                                                '${snapshot.data.data[first].feedCommentCnt} comment',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/svg/like_gray.svg',
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    GestureDetector(
                                                      child: Text(
                                                        'Like',
                                                      ),
                                                      onTap: () {
                                                        if (sptoken.data == null) {
                                                          Scaffold.of(context).showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Undo',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('You are not Login'),
                                                            ),
                                                          );
                                                        } else {
                                                          setState(() {});
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    if (sptoken.data == null) {
                                                      Scaffold.of(context).showSnackBar(
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
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/svg/comment.svg',
                                                        height: 20,
                                                        width: 20,
                                                        color:
                                                            isVisible ? Colors.pink : Colors.black,
                                                      ),
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Text(
                                                        'Comment',
                                                        style: TextStyle(
                                                          color: isVisible
                                                              ? Colors.pink
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              PopupView(),
                                            ],
                                          ),
                                        ),
                                        FutureBuilder(
                                            future: _getName(),
                                            builder: (context, spName) {
                                              if (spName.hasData) {
                                                return Visibility(
                                                    visible: isVisible,
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          Divider(color: Colors.grey),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.start,
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
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                            children: [
                                                              FutureBuilder(
                                                                future: _getImage(),
                                                                builder: (context, spImage) {
                                                                  if (spImage.hasData) {
                                                                    return Padding(
                                                                      padding:
                                                                          const EdgeInsets.only(
                                                                              right: 6.0, top: 8.0),
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
                                                                          const EdgeInsets.only(
                                                                              right: 6.0, top: 8.0),
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
                                                                        hintText:
                                                                            'Start typing your comment...',
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors.grey),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                                borderSide:
                                                                                    BorderSide(
                                                                                        color: Colors
                                                                                            .pink))),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(
                                                                    left: 6.0),
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
                                                                padding: const EdgeInsets.only(
                                                                    right: 6.0),
                                                                child: SvgPicture.asset(
                                                                  'assets/svg/anyonmans.svg',
                                                                  height: 40,
                                                                ),
                                                              ),
                                                              // SizedBox(
                                                              //   width: 5.0,
                                                              // ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment.start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'Mirza',
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 16),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5.0,
                                                                  ),
                                                                  Text(
                                                                    'comment',
                                                                    style: TextStyle(
                                                                        color: Colors.blueGrey,
                                                                        fontSize: 14),
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
                                                          // GestureDetector(
                                                          //   child: Text('load more'),
                                                          //   onTap: isProgressing,
                                                          // ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ));
                                              } else {
                                                return Text('${spName.error}');
                                              }
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
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
            } else if (!sptoken.hasData) {
              // Without Login part
              return FutureBuilder<FeedItemModel>(
                future: model.loadFeed(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.data?.length ?? 0,
                      itemBuilder: (context, first) {
                        return ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.data[first].details.authordetails?.length ?? 0,
                          itemBuilder: (context, second) {
                            if (snapshot.data.data[first].feedType == FeedType.QUERY) {
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
                                                      'Query on ${snapshot.data.data[first].categorymapping[second].category.category}',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    snapshot
                                                                .data
                                                                .data[first]
                                                                .feedqueryassigned[second]
                                                                .feedStatus ==
                                                            "ANSWERED"
                                                        ? Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/svg/check_pink.svg',
                                                                height: 15.0,
                                                                width: 15.0,
                                                              ),
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                              Text(
                                                                'Answered',
                                                                style: TextStyle(
                                                                    fontSize: 16.0,
                                                                    color: Colors.pink),
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
                                                  DateTimeAgo.timeAgoSinceDate(
                                                      '${snapshot.data.data[first].feedDate}'),
                                                  style: TextStyle(
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                              child: SvgPicture.asset('assets/svg/icon.svg'),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${snapshot.data.data[first].feedTitle}',
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false,
                                                maxLines: 3,
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 10.0, right: 10.0),
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                child: GestureDetector(
                                                  child: isBookmark == false
                                                      ? SvgPicture.asset(
                                                          "assets/svg/tag_inactive.svg")
                                                      : SvgPicture.asset(
                                                          "assets/svg/tag_active.svg"),
                                                  onTap: () {
                                                    if (sptoken.data == null) {
                                                      Scaffold.of(context).showSnackBar(
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
                                                        // toggleBookmark();
                                                      });
                                                    }
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 5.0),
                                        Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 10.0),
                                          child: Text(
                                            '${snapshot.data.data[first].feedDetail}',
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
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 14.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                descTextShowFlag
                                                    ? Text(
                                                        "Show Less",
                                                        style: TextStyle(color: Colors.grey),
                                                      )
                                                    : Text("Continue Reading",
                                                        style: TextStyle(color: Colors.grey))
                                              ],
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey, width: 0.5),
                                                borderRadius: BorderRadius.circular(5),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      snapshot
                                                                  .data
                                                                  .data[first]
                                                                  .details
                                                                  .authordetails[second]
                                                                  .user
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
                                                                    snapshot
                                                                        .data
                                                                        .data[first]
                                                                        .details
                                                                        .authordetails[second]
                                                                        .user
                                                                        .userImage,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            left: 8.0, top: 10.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              '${snapshot.data.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data.data[first].details.authordetails[second].user.firstName}' +
                                                                  ' ${snapshot.data.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data.data[first].details.authordetails[second].user?.lastName}',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 18),
                                                            ),
                                                            Text(
                                                                '${snapshot.data.data[first].details.authordetails[second].user.expertexpertisemapping[0].parentexpertise.expertiseName == null ? '' : snapshot.data.data[first].details.authordetails[second].user.expertexpertisemapping[second].parentexpertise.expertiseName}'),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    color: Colors.grey,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/svg/full_consultation.svg',
                                                        height: 15,
                                                        width: 15,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                          child: GestureDetector(
                                                              onTap: () {},
                                                              child:
                                                                  Text('See Full Consultation'))),
                                                      Container(
                                                          height: 30,
                                                          child:
                                                              VerticalDivider(color: Colors.grey)),
                                                      SvgPicture.asset(
                                                        'assets/svg/sidebar_query.svg',
                                                        height: 18,
                                                        width: 18,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {},
                                                          child: Text(
                                                              'Ask ${snapshot.data.data[first].details.authordetails[second].user.firstName + snapshot.data.data[first].details.authordetails[second].user.lastName}'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              left: 20,
                                              top: 2,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 5, left: 10, right: 10),
                                                color: Colors.white,
                                                child: Text(
                                                  'Expert Says',
                                                  style:
                                                      TextStyle(color: Colors.black, fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  '${snapshot.data.data[first].feedRelateCnt} Relate with this'),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 8.0, right: 8.0),
                                                child: Text('.'),
                                              ),
                                              Text(
                                                  '${snapshot.data.data[first].feedCommentCnt} Comment'),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/svg/relate_hand.svg',
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    GestureDetector(
                                                      child: Text(
                                                        'I Relate',
                                                      ),
                                                      onTap: () async {
                                                        if (sptoken.data == null) {
                                                          Scaffold.of(context).showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Undo',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('You are not Login'),
                                                            ),
                                                          );
                                                        } else {}
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  if (sptoken.data == null) {
                                                    Scaffold.of(context).showSnackBar(
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
                                                  padding: const EdgeInsets.only(top: 12.0),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/svg/comment.svg',
                                                        height: 20,
                                                        width: 20,
                                                        color: isVisible == false
                                                            ? Colors.black
                                                            : Colors.pink,
                                                      ),
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Text(
                                                        'Comment',
                                                        style: TextStyle(
                                                          color: isVisible == false
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
                                              PopupView(),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                            visible: isVisible,
                                            child: Container(
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
                                                              "name",
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
                                                              padding: const EdgeInsets.only(
                                                                  right: 6.0, top: 8.0),
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
                                                              padding: const EdgeInsets.only(
                                                                  right: 6.0, top: 8.0),
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
                                                                hintText:
                                                                    'Start typing your comment...',
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors.grey),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors.pink))),
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
                                                      // SizedBox(
                                                      //   width: 5.0,
                                                      // ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Mirza',
                                                            style: TextStyle(
                                                                color: Colors.black, fontSize: 16),
                                                          ),
                                                          SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Text(
                                                            'comment',
                                                            style: TextStyle(
                                                                color: Colors.blueGrey,
                                                                fontSize: 14),
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
                                                  // GestureDetector(
                                                  //   child: Text('load more'),
                                                  //   onTap: isProgressing,
                                                  // ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
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
                                            snapshot.data.data[first].details.authordetails[second]
                                                        .user.userImage ==
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
                                                          snapshot.data.data[first].details
                                                              .authordetails[second].user.userImage,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${snapshot.data.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data.data[first].details.authordetails[second].user.firstName}' +
                                                      ' ${snapshot.data.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data.data[first].details.authordetails[second].user?.lastName}',
                                                  style: TextStyle(
                                                      fontSize: 18.0, fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  '${snapshot.data.data[first].details.authordetails[second].user.authordetails[second].introduction}',
                                                  softWrap: true,
                                                  style:
                                                      TextStyle(fontSize: 11.0, color: Colors.grey),
                                                ),
                                                Text(
                                                  DateTimeAgo.timeAgoSinceDate(
                                                      '${snapshot.data.data[first].feedDate}'),
                                                  style: TextStyle(
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ],
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
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey)),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 250.0,
                                                  width: 330.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        snapshot.data.data[first].media[second]
                                                            .mediaPath,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Image.network(snapshot.data.data[first].media[second].mediaPath),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${snapshot.data.data[first].categorymapping[second].category.category}',
                                                      ),
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        child: GestureDetector(
                                                          child: isBookmark == false
                                                              ? SvgPicture.asset(
                                                                  "assets/svg/tag_inactive.svg")
                                                              : SvgPicture.asset(
                                                                  "assets/svg/tag_active.svg"),
                                                          onTap: () {
                                                            if (sptoken.data == null) {
                                                              Scaffold.of(context).showSnackBar(
                                                                SnackBar(
                                                                  action: SnackBarAction(
                                                                    label: 'Undo',
                                                                    onPressed: () {},
                                                                  ),
                                                                  content:
                                                                      Text('You are not Login'),
                                                                ),
                                                              );
                                                            } else {
                                                              setState(() {
                                                                // toggleBookmark();
                                                              });
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(10.0),
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
                                        SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                ' ${snapshot.data.data[first].feedLikeCnt} like',
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 8.0, right: 8.0),
                                                child: Text('.'),
                                              ),
                                              Text(
                                                '${snapshot.data.data[first].feedCommentCnt} comment',
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/svg/like_gray.svg',
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    GestureDetector(
                                                      child: Text(
                                                        'Like',
                                                      ),
                                                      onTap: () {
                                                        if (sptoken.data == null) {
                                                          Scaffold.of(context).showSnackBar(
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 12.0),
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    if (sptoken.data == null) {
                                                      Scaffold.of(context).showSnackBar(
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
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/svg/comment.svg',
                                                        height: 20,
                                                        width: 20,
                                                        color:
                                                            isVisible ? Colors.pink : Colors.black,
                                                      ),
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Text(
                                                        'Comment',
                                                        style: TextStyle(
                                                          color: isVisible
                                                              ? Colors.pink
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              PopupView(),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: isVisible,
                                          child: Container(
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
                                                            "name",
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
                                                            padding: const EdgeInsets.only(
                                                                right: 6.0, top: 8.0),
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
                                                            padding: const EdgeInsets.only(
                                                                right: 6.0, top: 8.0),
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
                                                              hintText:
                                                                  'Start typing your comment...',
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(color: Colors.grey),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors.pink))),
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
                                                    // SizedBox(
                                                    //   width: 5.0,
                                                    // ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Mirza',
                                                          style: TextStyle(
                                                              color: Colors.black, fontSize: 16),
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
                                                // GestureDetector(
                                                //   child: Text('load more'),
                                                //   onTap: isProgressing,
                                                // ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
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
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        endDrawer: FutureBuilder(
          future: _getToken(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // With Login
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
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
                                            )
                                          : Text(
                                              sp.data,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0),
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
                        decoration: BoxDecoration(
                            color: Colors.white70, border: Border.all(color: Colors.black12)),
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
                        onTap: () {
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
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  // SvgPicture.asset(
                                  //   'assets/svg/anyonmans.svg',
                                  //   height: 60,
                                  //   width: 60,
                                  // ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter + Alignment(0, 5),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 30.0, bottom: 20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      model.navigateToLoginView();
                                    },
                                    child: Text(
                                      'Login/SignUp',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white70, border: Border.all(color: Colors.black12)),
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
      ),
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) async {
        model.loadFeed();
        model.isUserSignedIn();
      },
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
