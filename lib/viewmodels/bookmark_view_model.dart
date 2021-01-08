import 'package:owomaniya/viewmodels/base_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkViewModel extends BaseModel {
  String _token;

  String get token => _token;

  Future<Map<String, dynamic>> removeBookmark(int bookmarkId) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = preferences.getString('token');
    final Map<String, dynamic> postBookmarkData = {"bookmark_id": bookmarkId};

    print('bookmarkid$bookmarkId');
    final response = await http.post(
      ApiUrls.REMOVE_BOOKMARK_URL + _token,
      body: jsonEncode(postBookmarkData),
      headers: {'content-Type': 'application/json'},
    );
    var result;
    setBusy(true);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      result = {'status': true, 'message': 'code ${response.body} '};
      print('bookmark  $result');
    } else {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('bookmark fail $result');
    }
    setBusy(false);
    return jsonDecode(response.body);
  }

}
