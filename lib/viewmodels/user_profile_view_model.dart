import 'dart:convert';
import 'package:owomaniya/model/user_profile.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileViewModel extends BaseModel {
  Future<UserProfile> getUserProfile() async {

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    final response = await http.get(
      ApiUrls.GET_USER_PROFILE_URL + token,
    );
    final jsonString = json.decode(response.body);

    if (response.statusCode == 200) {
      UserProfile model = UserProfile.fromJson(jsonString);
      print('${model.data.city}');
      return model;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future wait(int seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => {});
  }
}
