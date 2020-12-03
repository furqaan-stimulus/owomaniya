import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owomaniya/viewmodels/bookmark_view_model.dart';
import 'package:owomaniya/widget/bookmark_card.dart';
import 'package:stacked/stacked.dart';

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
        body: Column(
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
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
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
                                      color: isContainerVisible
                                          ? Colors.pink
                                          : Colors.black,
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
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 8.0, 8.0, 0.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FilterChip(
                                        onSelected: (bool value) {
                                          toggleAllFilter();
                                        },
                                        selectedColor: Colors.white,
                                        label: Text('All'),
                                        selected: isAllFilter,
                                        labelStyle: TextStyle(
                                            color: isAllFilter
                                                ? Colors.pink
                                                : Colors.black),
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
                                            color: isArticleFilter
                                                ? Colors.pink
                                                : Colors.black),
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
                                            color: isQueriesFilter
                                                ? Colors.pink
                                                : Colors.black),
                                        label: Text('Queries'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 0.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                color: isVideosFilter
                                                    ? Colors.pink
                                                    : Colors.black),
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
                                                color: isEventsFilter
                                                    ? Colors.pink
                                                    : Colors.black),
                                            label: Text('Events'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            child: Text(
                                              'Clear Filter',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
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
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BookmarkCard(),
                    BookmarkCard(),
                    BookmarkCard(),
                    BookmarkCard(),
                    BookmarkCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => BookmarkViewModel(),
    );
  }
}
