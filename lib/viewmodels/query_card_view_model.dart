import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:stacked_services/stacked_services.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueryCardViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  String _token;

  String get token => _token;

  // Future<List<Datum>> loadFeed() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var token = preferences.getString('token');
  //   http.Response response;
  //   if (_token == null) {
  //     response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL);
  //     final jsonString = json.decode(response.body);
  //     List<Datum> model = Datum.parseList(jsonString);
  //     return model;
  //   } else {
  //     response = await http.get(ApiUrls.GET_FEEDS_WITH_TOKEN_URL + token + ApiUrls.PAGE_NO);
  //     final jsonString = json.decode(response.body);
  //     List<Datum> model = Datum.parseList(jsonString);
  //     return model;
  //   }
  // }

  Future<Map<String, dynamic>> postBookmark(int feedId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postBookmarkData = {"feed_id": feedId};

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
      setBusy(false);
    } else {
      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
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
      print('bookmark  $result');
      setBusy(false);
    } else {
      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
      setBusy(false);
    }
    return jsonDecode(response.body);
  }

  Future navigateToAskExpertView(String expertName, String expertiseName) async {
    await _navigationService.navigateTo(route.Routes.askExpertView);
  }

  Future navigateToAskFullConsultationView() async {
    await _navigationService.navigateTo(route.Routes.fullConsultationView);
  }
}
