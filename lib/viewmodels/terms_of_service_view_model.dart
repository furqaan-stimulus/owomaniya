import 'dart:convert';
import 'package:owomaniya/model/terms_model.dart';
import 'package:http/http.dart' as http;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermsOfServiceViewModel extends BaseModel {
  Future<TermsModel> getTermsOfService() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    final response = await http.get(
      ApiUrls.GET_TERMS_OF_SERVICE_URL,
    );
    if (response.statusCode == 200) {
      return TermsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
