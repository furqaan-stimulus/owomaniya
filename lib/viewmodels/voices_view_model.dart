import 'dart:convert';

import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:http/http.dart' as http;
class VoicesViewModel extends BaseModel {


  Future<FeedItemModel> loadFeed() async {
    final response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL);
    final jsonString = json.decode(response.body);
    await wait(3);
    FeedItemModel model = FeedItemModel.fromJson(jsonString);
    print(model.data[0].feedUrl);
    return model;
  }

  Future wait(int seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => {});
  }
}
