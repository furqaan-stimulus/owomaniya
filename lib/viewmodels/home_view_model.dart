import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/model/feed_comments.dart';
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  Future<String> isUserSignedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    return token;
  }

  String _token;

  String get token => _token;

  Future<FeedItemModel> loadFeed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    if (_token == null) {
      response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL);
      final jsonString = json.decode(response.body);
      FeedItemModel model = FeedItemModel.fromJson(jsonString);

      return model;
    } else {
      response = await http.get(ApiUrls.GET_FEEDS_WITH_TOKEN_URL + token + ApiUrls.PAGE_NO);
      final jsonString = json.decode(response.body);
      FeedItemModel model = FeedItemModel.fromJson(jsonString);
      return model;
    }
  }

  Future<FeedComments> getComments(int feedId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    if (_token != null) {
      response = await http.get(ApiUrls.GET_FEED_COMMENT_URL + token + ApiUrls.FEED_NO + feedId.toString());
      final jsonString = json.decode(response.body);
      FeedComments model = FeedComments.fromJson(jsonString);
      return model;
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> postFeedComment(int feedId, String comment, String isAnonymous) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postFeedCommentData = {
      "feed_id": feedId,
      "comment": comment,
      "device_type": 'mobile',
      "device_os": ' android',
      "is_anonymous": isAnonymous
    };

    print('feedId$feedId');
    final response = await http.post(
      ApiUrls.POST_FEED_COMMENT_URL + token,
      body: jsonEncode(postFeedCommentData),
      headers: {'content-Type': 'application/json'},
    );
    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('comment  $result');
      setBusy(false);
    } else {
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('comment fail $result');
      setBusy(false);
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> postBookmark(int feedId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postBookmarkData = {"feed_id": feedId};
    notifyListeners();
    print('feedId$feedId');
    final response = await http.post(
      ApiUrls.ADD_BOOKMARK_URL + token,
      body: jsonEncode(postBookmarkData),
      headers: {'content-Type': 'application/json'},
    );
    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('bookmark  $result');
    } else {
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
    }
    setBusy(false);
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> likeArticle(int feedId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postLikeData = {"feed_id": feedId, "engagement_type": "likes"};

    print('feedId$feedId');
    final response = await http.post(
      ApiUrls.LIKE_ARTICLE_URL + token,
      body: jsonEncode(postLikeData),
      headers: {'content-Type': 'application/json'},
    );
    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('like  $result');
      setBusy(false);
    } else {
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('like fail $result');
      setBusy(false);
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> relateQuery(int feedId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postRelateData = {"feed_id": feedId, "engagement_type": "relate"};

    print('feedId$feedId');
    final response = await http.post(
      ApiUrls.RELATE_QUERY_URL + token,
      body: jsonEncode(postRelateData),
      headers: {'content-Type': 'application/json'},
    );
    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('relate  $result');
      setBusy(false);
    } else {
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('relate fail $result');
      setBusy(false);
    }
    return jsonDecode(response.body);
  }

  Future<Datum> loadFeedItem() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    if (_token == null) {
      response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL);
      final jsonString = json.decode(response.body);
      Datum model = Datum.fromJson(jsonString);
      return model;
    } else {
      response = await http.get(ApiUrls.GET_FEEDS_WITH_TOKEN_URL + token + ApiUrls.PAGE_NO);
      final jsonString = json.decode(response.body);
      Datum model = Datum.fromJson(jsonString);
      return model;
    }
  }
}
