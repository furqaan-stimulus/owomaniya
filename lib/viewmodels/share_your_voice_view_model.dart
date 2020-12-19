import 'dart:convert';
import 'package:http/http.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class ShareYourVoiceViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future<Map<String, dynamic>> shareVoice(String shortStory, String aboutYou) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var userId = preferences.getInt("user_id");
    var token = preferences.getString("token");

    if (token == null) {
      _navigationService.navigateTo(Routes.loginView);
    } else {
      final Map<String, dynamic> shareVoiceData = {
        'short_story': shortStory,
        'about_you': aboutYou,
      };
      setBusy(true);
      var result;
      Response response = await post(ApiUrls.SHARE_VOICE_URL + token,
          body: json.encode(shareVoiceData), headers: {'content-Type': 'application/json'});
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        var storyData = responseData['data'];
        result = {'status': true, 'message': 'code ${response.statusCode} '};
        _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
        print(storyData);
      } else {
        result = {'status': false, 'message': 'code ${response.statusCode} '};
      }
      return json.decode(response.body);
    }
  }
}
