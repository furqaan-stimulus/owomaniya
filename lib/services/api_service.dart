import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/utils/api_urls.dart';

class ApiService {
  Future<Map<String, dynamic>> postAskQuery(
      String message, String queryId, String orderId, String queryPrice) async {
    final Map<String, dynamic> postQueryData = {
      "message": message,
      "query_id": queryId,
      "order_id": orderId,
      "query_price": queryPrice,
    };
    http.Response response = await http.post(ApiUrls.ASK_QUERY_URL,
        body: json.encode(postQueryData),
        headers: {'content-Type': 'application/json'});

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getFeeds() async {
    var response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
    return json.decode(response.body);
  }
}
