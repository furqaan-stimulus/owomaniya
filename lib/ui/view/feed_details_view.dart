import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/model/feed_blog_details.dart' as feedBlog;
import 'package:owomaniya/model/feed_comments.dart';
import 'package:owomaniya/viewmodels/feed_details_view_model.dart';
import 'package:stacked/stacked.dart';

class FeedDetailsView extends StatefulWidget {
  final int feedId;
  final String userName;
  final String userImage;

  const FeedDetailsView({Key key, this.feedId, this.userName, this.userImage}) : super(key: key);

  @override
  _FeedDetailsViewState createState() => _FeedDetailsViewState();
}

class _FeedDetailsViewState extends State<FeedDetailsView> {
  bool onChecked = false;
  bool isCollapsed = false;
  final commentController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  void isAnonymous() {
    setState(() {
      onChecked = !onChecked;
    });
  }

  void isExpand() {
    setState(() {
      isCollapsed = !isCollapsed;
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
    return ViewModelBuilder<FeedDetailsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
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
        body: Container(
          child: FutureBuilder<feedBlog.FeedBlogDetails>(
            future: model.getFeedBlogDetails(widget.feedId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  snapshot.data.data.feedAuthors[0].userImage == null
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
                                                snapshot.data.data.feedAuthors[0].userImage,
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
                                            '${snapshot.data.data.feedAuthors[0].firstName == null ? '' : snapshot.data.data.feedAuthors[0].firstName}' +
                                                ' ${snapshot.data.data.feedAuthors[0].lastName == null ? '' : snapshot.data.data.feedAuthors[0].lastName}',
                                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 4.0),
                                          child: Text(
                                            '${snapshot.data.data.feedAuthors[0].authorinfo.introduction}',
                                            softWrap: true,
                                            style: TextStyle(fontSize: 14.0, color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                '${snapshot.data.data.feedTitle}',
                                style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      child: VerticalDivider(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                      child: Container(
                                        height: 25.0,
                                        width: 25.0,
                                        child: SvgPicture.asset('assets/svg/whatsapp.svg'),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: VerticalDivider(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                      child: Container(
                                        height: 25.0,
                                        width: 25.0,
                                        child: SvgPicture.asset('assets/svg/facebook.svg'),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: VerticalDivider(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                      child: Container(
                                        height: 25.0,
                                        width: 25.0,
                                        child: SvgPicture.asset('assets/svg/twitter.svg'),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: VerticalDivider(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                      child: Container(
                                        height: 25.0,
                                        width: 25.0,
                                        child: SvgPicture.asset('assets/svg/share_media.svg'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Html(data: snapshot.data.data.feedDetail),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/svg/comment.svg"),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text("${snapshot.data.data.feedCommentCnt} Comments"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: GestureDetector(
                                        onTap: () {
                                          isExpand();
                                        },
                                        child: Text("Collapse")),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Visibility(
                                visible: isCollapsed,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        onChecked
                                            ? Text(
                                                'Commenting as Anonymous',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              )
                                            : Text(
                                                "Commenting as ${widget.userName}",
                                                style: TextStyle(
                                                  fontSize: 12,
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
                                            fontSize: 14,
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
                                              : Image.network(
                                                  widget.userImage,
                                                  width: 40.0,
                                                  height: 40.0,
                                                ),
                                        ),
                                        Expanded(
                                          child: Container(
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
                                                  border:
                                                      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
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
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width: width / 0.5,
                                      height: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: FutureBuilder<List<FeedComments>>(
                                          future: model.getComments(widget.feedId),
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
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
      viewModelBuilder: () => FeedDetailsViewModel(),
      onModelReady: (model) {
        model.getFeedBlogDetails(widget.feedId);
      },
    );
  }
}
