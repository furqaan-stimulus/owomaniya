import 'dart:convert';

import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/model/privacy_model.dart';
import 'package:owomaniya/model/terms_model.dart';
import 'package:http/http.dart' as http;
import 'package:owomaniya/services/api_service.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacyPolicyViewModel extends BaseModel {
  Future<PrivacyModel> getPrivacyPolicy() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    final response = await http.get(ApiUrls.GET_PRIVACY_POLICY_URL);

    if (response.statusCode == 200) {
      return PrivacyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
