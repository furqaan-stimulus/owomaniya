import 'package:flutter/material.dart';

import 'package:owomaniya/model/feed.dart';

import 'package:owomaniya/widget/blog_post_card.dart';

class FeedItemList extends StatelessWidget {
  final List<Feed> feeds;

  FeedItemList({this.feeds});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 5.0,
      children: <Widget>[
        ...feeds.map((e) => BlogPostCard(model: feeds,))
      ],
    );
  }
}
