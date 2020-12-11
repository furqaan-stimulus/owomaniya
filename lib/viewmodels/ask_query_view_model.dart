import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/post_query.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class AskQueryViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future<Map<String, dynamic>> askQueryPost(String feedDetail) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    http.Response response;
    var result;
    var userId = preferences.getInt('user_id');
    var token = preferences.getString('token');

    final Map<String, dynamic> askQueryData = {
      'feed_type': 'query',
      'feed_detail': feedDetail,
      'device_type': 'mobile',
      'device_os': 'android',
    };

    preferences.setString('feed_detail', feedDetail);
    if (token == null) {
      print('fail');
      _navigationService.navigateTo(route.Routes.loginView);
    } else {
      setBusy(true);
      response = await http.post(ApiUrls.ASK_QUERY_URL + token,
          body: json.encode(askQueryData), headers: {'content-Type': 'application/json'});
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        var profileData = responseData;
        var model = PostQuery.fromJson(profileData);
        print('query ${model.data.queryId}');
        print('order ${model.data.orderId}');
        print('price ${model.data.queryPrice}');
        preferences.setInt("order_id", model.data.orderId);
        preferences.setInt("query_id", model.data.queryId);
        preferences.setString("query_price", model.data.queryPrice);
        _navigationService.navigateTo(route.Routes.paymentMethodView);
      } else {
        print(response.statusCode);
      }
    }
    return json.decode(response.body);
  }
}
