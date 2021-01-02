import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/model/feed_comments.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentViewModel extends BaseModel {
  String _token;

  String get token => _token;
  Future<FeedComments> getComments(
      int index,
      int feedId,
      ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var token = preferences.getString('token');
    http.Response response;
    if (_token != null) {
      response = await http.get(ApiUrls.GET_FEED_COMMENT_URL + token + ApiUrls.FEED_NO + "${3113}");
      final jsonString = json.decode(response.body);
      FeedComments model = FeedComments.fromJson(jsonString);
      print(" page :${model.data.currentPage}");
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
}
