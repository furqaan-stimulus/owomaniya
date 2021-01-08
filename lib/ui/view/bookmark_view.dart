import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/utils/date_time_ago.dart';
import 'package:owomaniya/viewmodels/bookmark_view_model.dart';
import 'package:stacked/stacked.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/model/get_bookmark.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkView extends StatefulWidget {
  @override
  _BookmarkViewState createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  bool isContainerVisible = false;
  bool isAllFilter = false;
  bool isArticleFilter = false;
  bool isQueriesFilter = false;
  bool isVideosFilter = false;
  bool isEventsFilter = false;

  List<GetBookmark> bookmarkList = [];

  void toggleVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
    });
  }

  void toggleAllFilter() {
    setState(() {
      isAllFilter = !isAllFilter;
    });
  }

  void toggleArticle() {
    setState(() {
      isArticleFilter = !isArticleFilter;
    });
  }

  void toggleQueries() {
    setState(() {
      isQueriesFilter = !isQueriesFilter;
    });
  }

  void toggleVideos() {
    setState(() {
      isVideosFilter = !isVideosFilter;
    });
  }

  void toggleEvents() {
    setState(() {
      isEventsFilter = !isEventsFilter;
    });
  }

  void clearAllFilter() {
    setState(() {
      isAllFilter = false;
      isArticleFilter = false;
      isQueriesFilter = false;
      isVideosFilter = false;
      isEventsFilter = false;
    });
  }

  Future<GetBookmark> getModel;

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookmarkViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/svg/sidebar_bookmarks.svg',
              height: 40,
              width: 40,
            ),
          ),
          title: Text(
            'Bookmarks',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
              child: Container(
                height: 30,
                width: 80,
                child: FlatButton(
                  onPressed: () {
                    toggleVisibility();
                  },
                  child: Text(
                    'Filter',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      children: [
                        Visibility(
                          visible: isContainerVisible,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      FilterChip(
                                        onSelected: (bool value) {},
                                        selectedColor: Colors.white,
                                        label: Text('All'),
                                        selected: isAllFilter,
                                        labelStyle: TextStyle(
                                            color: isAllFilter ? Colors.pink : Colors.black),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      FilterChip(
                                        onSelected: (bool value) {
                                          toggleArticle();
                                        },
                                        selectedColor: Colors.white,
                                        selected: isArticleFilter,
                                        labelStyle: TextStyle(
                                            color: isArticleFilter ? Colors.pink : Colors.black),
                                        label: Text('Article'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      FilterChip(
                                        onSelected: (bool value) {
                                          toggleQueries();
                                        },
                                        selectedColor: Colors.white,
                                        selected: isQueriesFilter,
                                        labelStyle: TextStyle(
                                            color: isQueriesFilter ? Colors.pink : Colors.black),
                                        label: Text('Queries'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          FilterChip(
                                            onSelected: (bool value) {
                                              toggleVideos();
                                            },
                                            selectedColor: Colors.white,
                                            selected: isVideosFilter,
                                            labelStyle: TextStyle(
                                                color: isVideosFilter ? Colors.pink : Colors.black),
                                            label: Text('Videos'),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          FilterChip(
                                            onSelected: (bool value) {
                                              toggleEvents();
                                            },
                                            selectedColor: Colors.white,
                                            selected: isEventsFilter,
                                            labelStyle: TextStyle(
                                                color: isEventsFilter ? Colors.pink : Colors.black),
                                            label: Text('Events'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            child: Text(
                                              'Clear Filter',
                                              style: TextStyle(color: Colors.black, fontSize: 16),
                                            ),
                                            onTap: () {
                                              clearAllFilter();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bookmarkList?.length ?? 0,
                  itemBuilder: (context, fIndex) {
                    if (bookmarkList.length == null) {
                      return Container(
                        child: Center(
                          child: Text(
                            "No Bookmark",
                            style: TextStyle(color: Colors.black, fontSize: 24.0),
                          ),
                        ),
                      );
                    } else {
                      if (bookmarkList[fIndex].feed.feedType == "Article") {
                        return Card(
                          elevation: 5.0,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/svg/tag_active.svg'),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        // bookmarked data
                                        child: Text(
                                          'Bookmarked on ${DateTimeAgo.formatDate('${bookmarkList[fIndex].updatedAt}')}',
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        child: GestureDetector(
                                            onTap: () {
                                              model.removeBookmark(bookmarkList[fIndex].id);
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  action: SnackBarAction(
                                                    label: 'Cancel',
                                                    onPressed: () {},
                                                  ),
                                                  content: Text('Bookmark removed'),
                                                ),
                                              );
                                            },
                                            child: SvgPicture.asset('assets/svg/delete.svg')),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/stethoscope.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                      SizedBox(
                                        width: 14.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              bookmarkList[fIndex].feed.feedTitle,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(DateTimeAgo.formatDate(
                                                '${bookmarkList[fIndex].feed.feedDate}')),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else if (bookmarkList[fIndex].feed.feedType == "Query") {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5.0,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset('assets/svg/tag_active.svg'),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            // bookmarked data
                                            child: Text(
                                              'Bookmarked on ${DateTimeAgo.formatDate('${bookmarkList[fIndex].updatedAt}')}',
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  model.removeBookmark(bookmarkList[fIndex].id);
                                                },
                                                child: SvgPicture.asset('assets/svg/delete.svg')),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            bookmarkList[fIndex]
                                                .feed
                                                .categoryMapping
                                                .elementAt(index)
                                                .category
                                                .iconPath,
                                            height: 50,
                                            width: 50,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    bookmarkList[fIndex]
                                                        .feed
                                                        .categoryMapping
                                                        .elementAt(index)
                                                        .category
                                                        .category,
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  bookmarkList[fIndex].feed.feedStatus == "ANSWERED"
                                                      ? Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/svg/check_pink.svg',
                                                              height: 12.0,
                                                              width: 12.0,
                                                            ),
                                                            SizedBox(
                                                              width: 5.0,
                                                            ),
                                                            Text(
                                                              'Answered',
                                                              style: TextStyle(
                                                                  fontSize: 12.0,
                                                                  color: Colors.pink),
                                                            ),
                                                          ],
                                                        )
                                                      : Text(''),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                width: 220,
                                                child: Text(
                                                  bookmarkList[fIndex].feed.feedTitle,
                                                  overflow: TextOverflow.ellipsis,
                                                  textDirection: TextDirection.ltr,
                                                  maxLines: 4,
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        Text("No Bookmark");
                      }
                    }
                    return Container(
                      child: Center(
                        child: Text(
                          "No Bookmark",
                          style: TextStyle(color: Colors.black, fontSize: 24.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => BookmarkViewModel(),
      onModelReady: (model) {
        getJsonData();
      },
    );
  }

  Future<List<GetBookmark>> getJsonData() async {
    Future.delayed(Duration(seconds: 2));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var response = await http.get(
      ApiUrls.GET_BOOKMARK_URL + token + ApiUrls.TYPE,
    );
    setState(() {
      bookmarkList =
          (json.decode(response.body)['data'] as List).map((e) => GetBookmark.fromJson(e)).toList();
    });
    return (json.decode(response.body)['data'] as List)
        .map((e) => GetBookmark.fromJson(e))
        .toList();
  }
}
