import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/model/feeds.dart';
import 'package:owomaniya/owPreferences/user_preferences.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = getIt<NavigationService>();
  final DialogService _dialogService = getIt<DialogService>();

  Future navigateToQueryView() async {
    _navigationService.navigateTo(route.Routes.askQueryView);
  }

  Future navigateToShareYourVoiceView() async {
    _navigationService.navigateTo(route.Routes.shareYourVoiceView);
  }

  Future navigateToPaymentMethodView() async {
    _navigationService.navigateTo(route.Routes.paymentMethodView);
  }

  Future navigateToUserProfileView() async {
    _navigationService.navigateTo(route.Routes.userProfileView);
  }

  Future navigateToRegisterAsExpertView() async {
    _navigationService.navigateTo(route.Routes.registerAsExpertView);
  }

  Future navigateToBookmarkView() async {
    _navigationService.navigateTo(route.Routes.bookmarkView);
  }

  Future logout() async {
    var response = await _dialogService.showDialog(
      title: 'Are You Sure',
      description: 'Do You want to Logout',
      buttonTitle: 'Logout ',
      cancelTitle: 'Cancel',
    );
    if (response is bool) {
      UserPreferences().removeUser();
      _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
    }
  }

  // List _list;
  //
  // List get list => _list;
  //
  // Future<String> getFeedItem() async {
  //   setBusy(true);
  //   final response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL);
  //   var jsonData = json.decode(response.body);
  //
  //   _list = jsonData["data"];
  //
  //   _list.add(jsonData["data"]);
  //   print('list ${_list[0]["feed_type"]}');
  //   print(
  //       'list ${_list[0]["details"]["authordetails"][0]["user"]["first_name"]}');
  //   print(
  //       'list ${_list[0]["details"]["authordetails"][0]["user"]["last_name"]}');
  //
  //   if (response.statusCode == 200) {
  //     var top = jsonData;
  //     var data = jsonData["data"];
  //     var data1 = jsonData["status"];
  //     var data2 = jsonData["meta"];
  //     var data3 = jsonData["links"];
  //
  //     print(" top --$top");
  //     print(" data --$data");
  //     print(" data1 --$data1");
  //     print(" data2 --$data2");
  //     print(" data3 --$data3");
  //   }
  //   setBusy(false);
  //   // return json.decode(response.body);
  // }
}
