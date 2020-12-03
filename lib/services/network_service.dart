import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/utils/app_exception.dart';

class NetworkService {
  Future<dynamic> get(String url, {Map<String, String> headers}) async {
    final response = await http.get(url, headers: headers);
    final body = response.body;
    final statusCode = response.statusCode;
    final decoded = json.decode(body);
    try {
      if (body == null) {
        throw MyHttpException(statusCode, 'Response body is null');
      }
      if (statusCode < 200 || statusCode >= 300) {
        throw MyHttpException(statusCode, decoded['message']);
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return decoded;
  }

  Future<dynamic> post(String url, body, header) async {
    var responseJson;
    try {
      final response = await http.post(url, body: jsonEncode(body));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }


}

class MyHttpException extends HttpException {
  final int statusCode;
  MyHttpException(this.statusCode, String message) : super(message);
}
