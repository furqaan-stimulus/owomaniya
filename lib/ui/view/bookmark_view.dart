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

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookmarkViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: FutureBuilder<GetBookmark>(
          future: getBookmark(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(26.0, 26.0, 26.0, 0.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/sidebar_bookmarks.svg',
                                          height: 40,
                                          width: 40,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Bookmarks',
                                          style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 45,
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        'Filter',
                                        style: TextStyle(
                                            color: isContainerVisible ? Colors.pink : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      onTap: () {
                                        toggleVisibility();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
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
                                              labelStyle:
                                                  TextStyle(color: isAllFilter ? Colors.pink : Colors.black),
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
                      padding: const EdgeInsets.fromLTRB(26.0, 0.0, 26.0, 0.0),
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              elevation: 5.0,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
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
                                              'Bookmarked on ${DateTimeAgo.formatDate('${snapshot.data.data[index].updatedAt}')}',
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  model.removeBookmark(snapshot.data.data[index].id);
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
                                                  snapshot.data.data[index].feed.feedTitle,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  maxLines: 3,
                                                  style:
                                                      TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(DateTimeAgo.formatDate(
                                                    '${snapshot.data.data[index].feed.feedDate}')),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
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
        ),
      ),
      viewModelBuilder: () => BookmarkViewModel(),
      onModelReady: (model) {
        getBookmark();
      },
    );
  }

  Future<GetBookmark> getBookmark() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    response = await http.get(
      ApiUrls.GET_BOOKMARK_URL + token + ApiUrls.TYPE,
    );
    final jsonString = json.decode(response.body);
    GetBookmark model = GetBookmark.fromJson(jsonString);
    print(model.data.length);
    return model;
  }
}
