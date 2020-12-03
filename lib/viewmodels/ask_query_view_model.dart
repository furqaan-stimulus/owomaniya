import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class AskQueryViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();

  Future navigateToSignUpView() async {
    _navigationService.navigateTo(route.Routes.signUpView);
  }

  Future<Map<String, dynamic>> askQueryPost(String feedDetail) async {
    final Map<String, dynamic> askQueryData = {
      'feed_type': 'query',
      'feed_detail': feedDetail,
      'device_type': 'mobile',
      'device_os': 'android',
    };
    setBusy(true);

    var result;
    http.Response response = await http.post(ApiUrls.ASK_QUERY_URL,
        body: json.encode(askQueryData),
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
