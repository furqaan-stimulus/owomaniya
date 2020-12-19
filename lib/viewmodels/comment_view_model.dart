import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentViewModel extends BaseModel {
  Future<Map<String, dynamic>> postFeedComment(
    int feedId,
    String comment,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postFeedCommentData = {
      "feed_id": feedId,
      "comment": comment,
      "device_type": 'mobile',
      "device_os": ' android',
      "is_anonymous": "Y"
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
      print('bookmark  $result');
      setBusy(false);
    } else {
      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
      setBusy(false);
    }
    return jsonDecode(response.body);
  }
}
