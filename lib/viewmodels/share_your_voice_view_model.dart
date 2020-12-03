import 'dart:convert';

import 'package:http/http.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';

class ShareYourVoiceViewModel extends BaseModel {
  Future<Map<String, dynamic>> shareVoice(
      String shortStory, String aboutYou) async {
    final Map<String, dynamic> shareVoiceData = {
      'short_story': shortStory,
      'about_you': aboutYou,
    };
    setBusy(true);
    var result;

    Response response = await post(ApiUrls.SHARE_VOICE_URL,
        body: json.encode(shareVoiceData),
        headers: {'content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var storyData = responseData['data'];
      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print(storyData);
    } else {
      result = {'status': false, 'message': 'code ${response.statusCode} '};
    }
    return json.decode(response.body);
  }
}
