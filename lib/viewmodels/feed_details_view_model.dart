import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:owomaniya/model/feed_blog_details.dart';
import 'package:owomaniya/model/feed_comments.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class FeedDetailsViewModel extends BaseViewModel {
  Future<FeedBlogDetails> getFeedBlogDetails(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    response = await http.get(ApiUrls.GET_FEED_DETAILS_URL + token + ApiUrls.BLOG_ID + "$id");
    // print("------${json.decode(response.body)['data']}-----");
    var jsonString = FeedBlogDetails.fromJson(json.decode(response.body));
    return jsonString;
  }

  Future<List<FeedComments>> getComments(
    int feedId,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    print("get comment id: $feedId");
    response = await http.get(ApiUrls.GET_FEED_COMMENT_URL + token + ApiUrls.FEED_NO + "$feedId");
    print("--------- ${json.decode(response.body)['data']['data']}");
    return (json.decode(response.body)['data']['data'] as List).map((e) => FeedComments.fromJson(e)).toList();
  }
}
