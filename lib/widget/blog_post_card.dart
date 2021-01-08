import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/model/feed.dart';
import 'package:owomaniya/widget/popup_view.dart';

class BlogPostCard extends StatefulWidget {
  final List<Feed> model;

  const BlogPostCard({Key key, this.model}) : super(key: key);

  @override
  _BlogPostCardState createState() => _BlogPostCardState(model);
}

class _BlogPostCardState extends State<BlogPostCard> {
  final List<Feed> model;

  bool onChecked = false;
  bool isVisible = false;
  bool isProgress = false;
  bool isBookmark = false;

  _BlogPostCardState(this.model);

  void toggleBookmark() {
    setState(() {
      isBookmark = !isBookmark;
    });
  }

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ListView.builder(
          itemCount: model.length,
          itemBuilder: (context, index) {
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
                          Image.asset(
                            model[index].details.authorDetails[index].user.userImage,
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 14.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'name',

                                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'intro',
                                style: TextStyle(fontSize: 16.0, color: Colors.grey),
                              ),
                              Text(
                                'time',
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/onboarding0.png'),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'category',
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      child: GestureDetector(
                                        child: isBookmark == true
                                            ? SvgPicture.asset("assets/svg/tag_inactive.svg")
                                            : SvgPicture.asset("assets/svg/tag_active.svg"),
                                        onTap: () {
                                          toggleBookmark();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'title',
                                  // '${model[index].data[index].feedTitle}',
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                ),
                              ],
                            ),
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
                            Text('like' // '${model[index].data[index].feedLikeCnt} Like this'
                                ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text('.'),
                            ),
                            Text('comment' // '${model[index].data[index].feedCommentCnt} Comment',
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
                                  Text('Like'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: GestureDetector(
                                onTap: toggleVisibility,
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
                                          'name',
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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6.0, top: 8.0),
                                    child: onChecked
                                        ? SvgPicture.asset(
                                            'assets/svg/anyonmans.svg',
                                            height: 40,
                                          )
                                        :
                                        // Image.network(
                                        //     model.details.user.userImage),

                                        Image.asset(
                                            'assets/images/onboarding0.png',
                                            height: 40,
                                          ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 200,
                                      child: TextField(
                                        maxLines: null,
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
                                      onTap: () {
                                        print('send');
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
                              Visibility(
                                visible: isProgress,
                                child: CircularProgressIndicator(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 6.0),
                                                child: SvgPicture.asset(
                                                  'assets/svg/anyonmans.svg',
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
                                                  Text(
                                                    'Mirza',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    'comment 1',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey, fontSize: 14),
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
                                              Padding(
                                                padding: const EdgeInsets.only(right: 6.0),
                                                child: SvgPicture.asset(
                                                  'assets/svg/anyonmans.svg',
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
                                                  Text(
                                                    'Mirza',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    'comment 2',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey, fontSize: 14),
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
                                              Padding(
                                                padding: const EdgeInsets.only(right: 6.0),
                                                child: SvgPicture.asset(
                                                  'assets/svg/anyonmans.svg',
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
                                                  Text(
                                                    'Mirza',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    'comment 3',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey, fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                              GestureDetector(
                                child: Text('load more'),
                                onTap: isProgressing,
                              ),
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
          },
        ),
      ),
    );
  }
}
