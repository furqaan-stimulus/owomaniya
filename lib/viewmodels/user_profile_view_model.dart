import 'dart:async';
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
      return model;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future wait(int seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => {});
  }

  Future<Map<String, dynamic>> postUserProfile(
      String email,
      String mobileNumber,
      String dateOfBirth,
      String gender,
      String city,
      String country,
      String maritalStatus,
      String firstName,
      String lastName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    int height = 0;
    int weight = 0;
    String heightUnit = "cm";
    String weightUnit = "kg";
    String bloodGroup = "o+";
    int bmi = 0;

    final Map<String, dynamic> userProfileUpdate = {
      'email_address': email,
      'mobile_no': mobileNumber,
      'first_name': firstName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'last_name': lastName,
      'city': city,
      'country': country,
      'marital_status': maritalStatus,
      'height': height,
      'weight': weight,
      'height_unit': heightUnit,
      'weight_unit': weightUnit,
      'blood_group': bloodGroup,
      'bmi': bmi,
    };

    final response = await http.post(
      ApiUrls.UPDATE_USER_PROFILE_URL + token,
      body: jsonEncode(userProfileUpdate),
      headers: {'content-Type': 'application/json'},
    );

    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('bookmark  $result');
    } else {
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
    }
    setBusy(false);
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> postUserImage(String userImage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    final Map<String, dynamic> imageData = {'user_image': userImage};

    final response = await http.post(
      ApiUrls.UPDATE_PROFILE_PICTURE_URL + token,
      body: imageData,
      headers: {'content-Type': 'application/json'},
    );
    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('bookmark  $result');
    } else {
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
    }
    setBusy(false);
    return jsonDecode(response.body);
  }
}
