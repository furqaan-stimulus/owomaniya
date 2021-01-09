import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/utils/date_time_ago.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/home_view_model.dart';
import 'package:owomaniya/widget/popup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../model/feed_item_model.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool descTextShowFlag = false;
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  Future<List<Datum>> feedModel;
  ScrollController _sc = new ScrollController();

  @override
  void initState() {
    super.initState();
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
              return FutureBuilder<List<Datum>>(
                future: feedModel,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        controller: _sc,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, first) {
                          return ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data[first].details.authordetails?.length ?? 0,
                            itemBuilder: (context, second) {
                              if (snapshot.data[first].feedType == FeedType.QUERY) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Card(
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
                                                          style: TextStyle(
                                                              fontSize: 14.0, color: Colors.grey),
                                                        ),
                                                        Text(
                                                          '${snapshot.data[first].categorymapping[second].category.category}',
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        snapshot
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
                                                                    width: 5.0,
                                                                  ),
                                                                  Text(
                                                                    'Answered',
                                                                    style: TextStyle(
                                                                        fontSize: 14.0,
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
                                                          '${snapshot.data[first].feedDate}'),
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
                                                    '${snapshot.data[first].feedTitle}',
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
                                                      child:
                                                          snapshot.data[first].bookmarked == false
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
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Undo',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('You are not Login'),
                                                            ),
                                                          );
                                                        } else {
                                                          if (snapshot.data[first].bookmarked ==
                                                              false) {
                                                            model.postBookmark(
                                                                snapshot.data[first].id);
                                                            snapshot.data[first].bookmarked =
                                                                !snapshot.data[first].bookmarked;
                                                            ScaffoldMessenger.of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                action: SnackBarAction(
                                                                  label: 'Cancel',
                                                                  onPressed: () {},
                                                                ),
                                                                content: Text('Bookmark Added'),
                                                              ),
                                                            );
                                                          } else {
                                                            model.postBookmark(
                                                                snapshot.data[first].id);
                                                            snapshot.data[first].bookmarked =
                                                                !snapshot.data[first].bookmarked;
                                                            ScaffoldMessenger.of(context)
                                                                .showSnackBar(
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
                                                '${snapshot.data[first].feedDetail}',
                                                maxLines: descTextShowFlag ? 8 : 2,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                model.launchUrl(snapshot.data[first].feedUrl);
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
                                                      : Text("Continue Reading",
                                                          style: TextStyle(color: Colors.grey))
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 15.0),
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.only(
                                                      top: 20.0,
                                                      bottom: 10.0,
                                                      left: 10.0,
                                                      right: 10.0),
                                                  decoration: BoxDecoration(
                                                    border:
                                                        Border.all(color: Colors.grey, width: 0.5),
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
                                                          snapshot
                                                                      .data[first]
                                                                      .details
                                                                      .authordetails[second]
                                                                      .user
                                                                      .userImage ==
                                                                  null
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
                                                                        snapshot
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
                                                            padding:
                                                                const EdgeInsets.only(left: 8.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  '${snapshot.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data[first].details.authordetails[second].user.firstName}' +
                                                                      ' ${snapshot.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data[first].details.authordetails[second].user?.lastName}',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 16),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 4.0),
                                                                  child: Text(
                                                                    '${snapshot.data[first].details.authordetails[second].user.expertexpertisemapping[second].parentexpertise.expertiseName == null ? '' : snapshot.data[first].details.authordetails[second].user.expertexpertisemapping[second].parentexpertise.expertiseName}',
                                                                    style: TextStyle(
                                                                        color: Colors.grey,
                                                                        fontSize: 14.0),
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
                                                      Divider(
                                                        color: Colors.grey,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.spaceAround,
                                                        children: [
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(top: 8.0),
                                                            child: SvgPicture.asset(
                                                              'assets/svg/full_consultation.svg',
                                                              height: 14,
                                                              width: 14,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(top: 8.0),
                                                            child: GestureDetector(
                                                                onTap: () {
                                                                  model.launchUrl(
                                                                      snapshot.data[first].feedUrl);
                                                                },
                                                                child: Text(
                                                                  'See Full Consultation',
                                                                  style: TextStyle(fontSize: 13.0),
                                                                )),
                                                          ),
                                                          Container(
                                                              height: 30,
                                                              child: VerticalDivider(
                                                                  color: Colors.grey)),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(top: 8.0),
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
                                                            padding:
                                                                const EdgeInsets.only(top: 8.0),
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                var fName = snapshot
                                                                    .data[first]
                                                                    .details
                                                                    .authordetails[second]
                                                                    .user
                                                                    .firstName;
                                                                var lName = snapshot
                                                                    .data[first]
                                                                    .details
                                                                    .authordetails[second]
                                                                    .user
                                                                    .lastName;
                                                                var fullName =
                                                                    "$fName" + " " + "$lName";
                                                                var expertise = snapshot
                                                                    .data[first]
                                                                    .details
                                                                    .authordetails[second]
                                                                    .user
                                                                    .expertexpertisemapping[second]
                                                                    .parentexpertise
                                                                    .expertiseName;
                                                                var img = snapshot
                                                                    .data[first]
                                                                    .details
                                                                    .authordetails[second]
                                                                    .user
                                                                    .userImage;

                                                                model.navigateToExpertScreen(
                                                                    fullName,
                                                                    expertise,
                                                                    img,
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'Ask ${snapshot.data[first].details.authordetails[second].user.firstName} ${snapshot.data[first].details.authordetails[second].user.lastName}',
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
                                                      style: TextStyle(
                                                          color: Colors.black, fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15.0),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                    '${snapshot.data[first].feedRelateCnt} Relate with this'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(left: 8.0, right: 8.0),
                                                  child: Text('.'),
                                                ),
                                                Text(
                                                    '${snapshot.data[first].feedCommentCnt} Comment'),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
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
                                                        if (snapshot.data[first].relate == false) {
                                                          model
                                                              .relateQuery(snapshot.data[first].id);
                                                          snapshot.data[first].relate =
                                                              !snapshot.data[first].relate;
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Cancel',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('Relate'),
                                                            ),
                                                          );
                                                          print("Query card if condition");
                                                        } else {
                                                          model
                                                              .relateQuery(snapshot.data[first].id);
                                                          snapshot.data[first].relate =
                                                              !snapshot.data[first].relate;
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Cancel',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('Relate removed'),
                                                            ),
                                                          );
                                                          print("Query card else condition");
                                                        }
                                                      }
                                                    },
                                                    child: Row(
                                                      children: [
                                                        snapshot.data[first].relate == false
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
                                                              color: snapshot.data[first].relate ==
                                                                      false
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
                                                        model.navigateToCommentScreen(
                                                            snapshot.data[first].id, context);
                                                      });
                                                    }
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 10.0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/svg/comment.svg',
                                                          height: 20,
                                                          width: 20,
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          'Comment',
                                                          style: TextStyle(
                                                            color: Colors.black,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Card(
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
                                                snapshot.data[first].details.authordetails[second]
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
                                                              snapshot
                                                                  .data[first]
                                                                  .details
                                                                  .authordetails[second]
                                                                  .user
                                                                  .userImage,
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
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 4.0),
                                                        child: Text(
                                                          '${snapshot.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data[first].details.authordetails[second].user.firstName}' +
                                                              ' ${snapshot.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data[first].details.authordetails[second].user?.lastName}',
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 4.0),
                                                        child: Text(
                                                          '${snapshot.data[first].details.authordetails[second].user.authordetails[second].introduction}',
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              fontSize: 14.0, color: Colors.grey),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 4.0),
                                                        child: Text(
                                                          DateTimeAgo.timeAgoSinceDate(
                                                              '${snapshot.data[first].feedDate}'),
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                          ),
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
                                                model.launchUrl(snapshot.data[first].feedUrl);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: Colors.grey, width: 0.5),
                                                  borderRadius: BorderRadius.circular(3),
                                                ),
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
                                                            snapshot.data[first].media[second]
                                                                .mediaPath,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // Image.network(snapshot.data.data[first].media[second].mediaPath),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          10.0, 10.0, 10.0, 10.0),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            '${snapshot.data[first].categorymapping[second].category.category}',
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 20,
                                                            child: GestureDetector(
                                                              child:
                                                                  snapshot.data[first].bookmarked ==
                                                                          false
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
                                                                  ScaffoldMessenger.of(context)
                                                                      .showSnackBar(
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
                                                                  if (snapshot
                                                                          .data[first].bookmarked ==
                                                                      false) {
                                                                    snapshot.data.forEach((datum) {
                                                                      var book = datum.bookmarked;
                                                                      var id = datum.id;
                                                                      if (book) {
                                                                        print(
                                                                            "Query card if condition: $book");
                                                                        print(
                                                                            "Query card if condition : $id");
                                                                      } else {
                                                                        print(
                                                                            "Query card else condition : $book");
                                                                        print(
                                                                            "Query card else condition : $id");
                                                                      }
                                                                    });
                                                                    model.postBookmark(
                                                                        snapshot.data[first].id);
                                                                    snapshot.data[first]
                                                                            .bookmarked =
                                                                        !snapshot
                                                                            .data[first].bookmarked;
                                                                    ScaffoldMessenger.of(context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        action: SnackBarAction(
                                                                          label: 'Cancel',
                                                                          onPressed: () {},
                                                                        ),
                                                                        content:
                                                                            Text('Bookmark Added'),
                                                                      ),
                                                                    );
                                                                    print(
                                                                        "Query card if condition :");
                                                                  } else {
                                                                    snapshot.data.forEach((datum) {
                                                                      var book = datum.bookmarked;
                                                                      var id = datum.id;
                                                                      if (book) {
                                                                        print(
                                                                            "Query card if condition : $book");
                                                                        print(
                                                                            "Query card if condition : $id");
                                                                      } else {
                                                                        print(
                                                                            "Query card else condition : $book");
                                                                        print(
                                                                            "Query card else condition : $id");
                                                                      }
                                                                    });
                                                                    model.postBookmark(
                                                                        snapshot.data[first].id);
                                                                    snapshot.data[first]
                                                                            .bookmarked =
                                                                        !snapshot
                                                                            .data[first].bookmarked;
                                                                    ScaffoldMessenger.of(context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        action: SnackBarAction(
                                                                          label: 'Cancel',
                                                                          onPressed: () {},
                                                                        ),
                                                                        content: Text(
                                                                            'Bookmark removed'),
                                                                      ),
                                                                    );
                                                                    print(
                                                                        "Query card else condition :");
                                                                  }
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 35.0, 25.0),
                                                      child: Text(
                                                        '${snapshot.data[first].feedTitle}',
                                                        textAlign: TextAlign.left,
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    ' ${snapshot.data[first].feedLikeCnt} like this',
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8.0, right: 8.0),
                                                    child: Text(
                                                      '.',
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data[first].feedCommentCnt} comments',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
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
                                                        if (snapshot.data[first].liked == false) {
                                                          model
                                                              .likeArticle(snapshot.data[first].id);
                                                          snapshot.data[first].liked =
                                                              !snapshot.data[first].liked;
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Cancel',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('Like Post'),
                                                            ),
                                                          );
                                                        } else {
                                                          model
                                                              .likeArticle(snapshot.data[first].id);
                                                          snapshot.data[first].liked =
                                                              !snapshot.data[first].liked;
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Cancel',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('Like removed'),
                                                            ),
                                                          );
                                                        }
                                                      }
                                                    },
                                                    child: Row(
                                                      children: [
                                                        snapshot.data[first].liked == false
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
                                                            color:
                                                                snapshot.data[first].liked == false
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
                                                    key: UniqueKey(),
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
                                                        model.navigateToCommentScreen(
                                                            snapshot.data[first].id, context);
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
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          'Comment',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                PopupView(),
                                              ],
                                            ),
                                          ],
                                        ),
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
                  } else {
                    return Center(
                      child: LinearProgressIndicator(),
                    );
                  }
                },
              );
            } else if (!sptoken.hasData) {
              // Without Login part
              return FutureBuilder<List<Datum>>(
                future: feedModel,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, first) {
                          return ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data[first].details.authordetails?.length ?? 0,
                            itemBuilder: (context, second) {
                              if (snapshot.data[first].feedType == FeedType.QUERY) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Card(
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
                                                          style: TextStyle(
                                                              fontSize: 14.0, color: Colors.grey),
                                                        ),
                                                        Text(
                                                          '${snapshot.data[first].categorymapping[second].category.category}',
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        snapshot
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
                                                                    width: 5.0,
                                                                  ),
                                                                  Text(
                                                                    'Answered',
                                                                    style: TextStyle(
                                                                        fontSize: 14.0,
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
                                                          '${snapshot.data[first].feedDate}'),
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
                                                    '${snapshot.data[first].feedTitle}',
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
                                                      child: snapshot.data[first].bookmarked ==
                                                              false
                                                          ? SvgPicture.asset(
                                                              "assets/svg/tag_inactive.svg",
                                                              width: 10.0,
                                                              height: 16.0,
                                                              key: ValueKey(
                                                                  snapshot.data[first].bookmarked),
                                                            )
                                                          : SvgPicture.asset(
                                                              "assets/svg/tag_active.svg",
                                                              width: 10.0,
                                                              height: 16.0,
                                                              key: ValueKey(
                                                                  snapshot.data[first].bookmarked),
                                                            ),
                                                      onTap: () {
                                                        if (sptoken.data == null) {
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Undo',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('You are not Login'),
                                                            ),
                                                          );
                                                        } else {
                                                          if (snapshot.data[first].bookmarked ==
                                                              false) {
                                                            model.postBookmark(
                                                                snapshot.data[first].id);
                                                            snapshot.data[first].bookmarked =
                                                                !snapshot.data[first].bookmarked;
                                                            ScaffoldMessenger.of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                action: SnackBarAction(
                                                                  label: 'Cancel',
                                                                  onPressed: () {},
                                                                ),
                                                                content: Text('Bookmark Added'),
                                                              ),
                                                            );
                                                          } else {
                                                            model.postBookmark(
                                                                snapshot.data[first].id);
                                                            snapshot.data[first].bookmarked =
                                                                !snapshot.data[first].bookmarked;
                                                            ScaffoldMessenger.of(context)
                                                                .showSnackBar(
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
                                                '${snapshot.data[first].feedDetail}',
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
                                                      : Text("Continue Reading",
                                                          style: TextStyle(color: Colors.grey))
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 15.0),
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.only(
                                                      top: 20.0,
                                                      bottom: 10.0,
                                                      left: 10.0,
                                                      right: 10.0),
                                                  decoration: BoxDecoration(
                                                    border:
                                                        Border.all(color: Colors.grey, width: 0.5),
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
                                                          snapshot
                                                                      .data[first]
                                                                      .details
                                                                      .authordetails[second]
                                                                      .user
                                                                      .userImage ==
                                                                  null
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
                                                                        snapshot
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
                                                            padding:
                                                                const EdgeInsets.only(left: 8.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  '${snapshot.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data[first].details.authordetails[second].user.firstName}' +
                                                                      ' ${snapshot.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data[first].details.authordetails[second].user?.lastName}',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 16),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 4.0),
                                                                  child: Text(
                                                                    '${snapshot.data[first].details.authordetails[second].user.expertexpertisemapping[second].parentexpertise.expertiseName == null ? '' : snapshot.data[first].details.authordetails[second].user.expertexpertisemapping[second].parentexpertise.expertiseName}',
                                                                    style: TextStyle(
                                                                        color: Colors.grey,
                                                                        fontSize: 14.0),
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
                                                      Divider(
                                                        color: Colors.grey,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.spaceAround,
                                                        children: [
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(top: 8.0),
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
                                                              padding:
                                                                  const EdgeInsets.only(top: 8.0),
                                                              child: GestureDetector(
                                                                  onTap: () {
                                                                    ScaffoldMessenger.of(context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        action: SnackBarAction(
                                                                          label: 'Undo',
                                                                          onPressed: () {},
                                                                        ),
                                                                        content: Text(
                                                                            'You are not Login'),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    'See Full Consultation',
                                                                    style:
                                                                        TextStyle(fontSize: 13.0),
                                                                  )),
                                                            ),
                                                          ),
                                                          Container(
                                                              height: 30,
                                                              child: VerticalDivider(
                                                                  color: Colors.grey)),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(top: 8.0),
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
                                                            padding:
                                                                const EdgeInsets.only(top: 8.0),
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                ScaffoldMessenger.of(context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    action: SnackBarAction(
                                                                      label: 'Undo',
                                                                      onPressed: () {},
                                                                    ),
                                                                    content:
                                                                        Text('You are not Login'),
                                                                  ),
                                                                );
                                                              },
                                                              child: Text(
                                                                'Ask ${snapshot.data[first].details.authordetails[second].user.firstName} ${snapshot.data[first].details.authordetails[second].user.lastName}',
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
                                                      style: TextStyle(
                                                          color: Colors.black, fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15.0),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                    '${snapshot.data[first].feedRelateCnt} Relate with this'),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(left: 8.0, right: 8.0),
                                                  child: Text('.'),
                                                ),
                                                Text(
                                                    '${snapshot.data[first].feedCommentCnt} Comment'),
                                              ],
                                            ),
                                            SizedBox(height: 15.0),
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
                                                        if (snapshot.data[first].relate == false) {
                                                          model
                                                              .relateQuery(snapshot.data[first].id);
                                                          snapshot.data[first].relate =
                                                              !snapshot.data[first].relate;
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Cancel',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('Relate'),
                                                            ),
                                                          );
                                                          print("Query card if condition :");
                                                        } else {
                                                          model
                                                              .relateQuery(snapshot.data[first].id);
                                                          snapshot.data[first].relate =
                                                              !snapshot.data[first].relate;
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Cancel',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('Relate removed'),
                                                            ),
                                                          );
                                                          print("Query card else condition :");
                                                        }
                                                      }
                                                    },
                                                    child: Row(
                                                      children: [
                                                        snapshot.data[first].relate == false
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
                                                              color: snapshot.data[first].relate ==
                                                                      false
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
                                                    } else {}
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 10.0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/svg/comment.svg',
                                                          height: 20,
                                                          width: 20,
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          'Comment',
                                                          style: TextStyle(
                                                            color: Colors.black,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  child: Card(
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
                                                snapshot.data[first].details.authordetails[second]
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
                                                              snapshot
                                                                  .data[first]
                                                                  .details
                                                                  .authordetails[second]
                                                                  .user
                                                                  .userImage,
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
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 4.0),
                                                        child: Text(
                                                          '${snapshot.data[first].details.authordetails[second].user.firstName == null ? '' : snapshot.data[first].details.authordetails[second].user.firstName}' +
                                                              ' ${snapshot.data[first].details.authordetails[second].user?.lastName == null ? '' : snapshot.data[first].details.authordetails[second].user?.lastName}',
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 4.0),
                                                        child: Text(
                                                          '${snapshot.data[first].details.authordetails[second].user.authordetails[second].introduction}',
                                                          softWrap: true,
                                                          style: TextStyle(
                                                              fontSize: 14.0, color: Colors.grey),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 4.0),
                                                        child: Text(
                                                          DateTimeAgo.timeAgoSinceDate(
                                                              '${snapshot.data[first].feedDate}'),
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                          ),
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
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border:
                                                      Border.all(color: Colors.grey, width: 0.5),
                                                  borderRadius: BorderRadius.circular(3),
                                                ),
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
                                                            snapshot.data[first].media[second]
                                                                .mediaPath,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // Image.network(snapshot.data.data[first].media[second].mediaPath),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          10.0, 10.0, 10.0, 10.0),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            '${snapshot.data[first].categorymapping[second].category.category}',
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 20,
                                                            child: GestureDetector(
                                                              child:
                                                                  snapshot.data[first].bookmarked ==
                                                                          false
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
                                                                  ScaffoldMessenger.of(context)
                                                                      .showSnackBar(
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
                                                                  if (snapshot
                                                                          .data[first].bookmarked ==
                                                                      false) {
                                                                    model.postBookmark(
                                                                        snapshot.data[first].id);
                                                                    snapshot.data[first]
                                                                            .bookmarked =
                                                                        !snapshot
                                                                            .data[first].bookmarked;
                                                                    ScaffoldMessenger.of(context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        action: SnackBarAction(
                                                                          label: 'Cancel',
                                                                          onPressed: () {},
                                                                        ),
                                                                        content:
                                                                            Text('Bookmark Added'),
                                                                      ),
                                                                    );
                                                                    print(
                                                                        "Query card if condition :");
                                                                  } else {
                                                                    model.postBookmark(
                                                                        snapshot.data[first].id);
                                                                    snapshot.data[first]
                                                                            .bookmarked =
                                                                        !snapshot
                                                                            .data[first].bookmarked;
                                                                    ScaffoldMessenger.of(context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        action: SnackBarAction(
                                                                          label: 'Cancel',
                                                                          onPressed: () {},
                                                                        ),
                                                                        content: Text(
                                                                            'Bookmark removed'),
                                                                      ),
                                                                    );
                                                                    print(
                                                                        "Query card if condition :");
                                                                  }
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          10.0, 0.0, 35.0, 25.0),
                                                      child: Text(
                                                        '${snapshot.data[first].feedTitle}',
                                                        textAlign: TextAlign.left,
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    ' ${snapshot.data[first].feedLikeCnt} like this',
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8.0, right: 8.0),
                                                    child: Text(
                                                      '.',
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data[first].feedCommentCnt} comments',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
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
                                                        if (snapshot.data[first].liked == false) {
                                                          model
                                                              .likeArticle(snapshot.data[first].id);
                                                          snapshot.data[first].liked =
                                                              !snapshot.data[first].liked;
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Cancel',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('Like Post'),
                                                            ),
                                                          );
                                                        } else {
                                                          model
                                                              .likeArticle(snapshot.data[first].id);
                                                          snapshot.data[first].liked =
                                                              !snapshot.data[first].liked;
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              action: SnackBarAction(
                                                                label: 'Cancel',
                                                                onPressed: () {},
                                                              ),
                                                              content: Text('Like removed'),
                                                            ),
                                                          );
                                                        }
                                                      }
                                                    },
                                                    child: Row(
                                                      children: [
                                                        snapshot.data[first].liked == false
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
                                                            color:
                                                                snapshot.data[first].liked == false
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
                                                    key: UniqueKey(),
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
                                                      } else {}
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
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          'Comment',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                PopupView(),
                                              ],
                                            ),
                                          ],
                                        ),
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
                  } else {
                    return Center(
                      child: LinearProgressIndicator(),
                    );
                  }
                },
              );
            } else {
              return Center(
                child: LinearProgressIndicator(),
              );
            }
          },
        ),
        endDrawer: FutureBuilder(
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
                                    print("drawer card if condition :");
                                    return CircleAvatar(
                                      backgroundImage: NetworkImage(spImage.data),
                                      radius: 35,
                                    );
                                  } else {
                                    print("drawer card if condition :");
                                    return Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svg/anyonmans.svg",
                                          width: 60,
                                          height: 60,
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
                                  print(' drawer: ${sp.error}');
                                  return Container();
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
        feedModel = model.loadFeed();
        _getImage();
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
    final String fullname = '$fName $lName';
    return fullname;
  }

  Future _getImage() async {
    final SharedPreferences pref = await preferences;
    final String image = pref.getString("user_image");
    return image;
  }
}
