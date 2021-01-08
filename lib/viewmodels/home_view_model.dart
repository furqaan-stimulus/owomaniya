import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:owomaniya/model/feed.dart';
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/ui/view/comment_view.dart';
import 'package:owomaniya/ui/view/ask_expert_view.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/app/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends BaseViewModel {
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

  Future navigateToVoicesView() async {
    _navigationService.navigateTo(route.Routes.voicesView);
  }

  Future navigateToLoginView() async {
    _navigationService.navigateTo(route.Routes.loginView);
  }

  Future navigateToMyConsultationView() async {
    _navigationService.navigateTo(route.Routes.myConsultationView);
  }

  Future logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.setString("token", null);
    preferences.clear();
    var response;
    response = await _dialogService.showDialog(
      title: 'Are You Sure',
      description: 'Do You want to Logout',
      buttonTitle: 'Logout ',
      cancelTitle: 'Cancel',
    );
    if (token == null) {
      _navigationService.pushNamedAndRemoveUntil(route.Routes.homeView);
    }
  }

  Future<String> isUserSignedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    return token;
  }

  String _token;

  String get token => _token;

  List<Feed> _feed;

  List<Feed> get feed => _feed;

  Future navigateToAskExpertView() async {
    await _navigationService.navigateTo(route.Routes.askExpertView);
  }

  navigateToCommentScreen(int item, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CommentView(itemHolder: item)));
  }

  navigateToExpertScreen(
      String doctorName, String expertiseFiled, String image, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AskExpertView(
                  doctorName: doctorName,
                  expertiseField: expertiseFiled,
                  doctorImage: image,
                )));
  }

  Future navigateToCommentView() async {
    await _navigationService.navigateTo(route.Routes.commentView);
  }

  int page = 1;

  Future<FeedItemModel> loadFeed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    if (_token == null) {
      response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL + "$page");
      final jsonString = json.decode(response.body);
      FeedItemModel model = FeedItemModel.fromJson(jsonString);
      return model;
    } else {
      response =
          await http.get(ApiUrls.GET_FEEDS_WITH_TOKEN_URL + token + ApiUrls.PAGE_NO + "$page");
      final jsonString = json.decode(response.body);
      FeedItemModel model = FeedItemModel.fromJson(jsonString);
      return model;
    }
  }

  Future<List<Feed>> getFeedList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    if (_token == null) {
      response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL + "$page");
      _feed = (json.decode(response.body)['data'] as List).map((i) => Feed.fromJson(i)).toList();
    } else {
      response =
          await http.get(ApiUrls.GET_FEEDS_WITH_TOKEN_URL + token + ApiUrls.PAGE_NO + "$page");
      _feed = (json.decode(response.body)['data'] as List).map((i) => Feed.fromJson(i)).toList();
    }
    return (json.decode(response.body)['data'] as List).map((i) => Feed.fromJson(i)).toList();
  }

  Future<Map<String, dynamic>> postBookmark(int feedId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postBookmarkData = {"feed_id": feedId};
    notifyListeners();
    print('feedId $feedId');
    final response = await http.post(
      ApiUrls.ADD_BOOKMARK_URL + token,
      body: jsonEncode(postBookmarkData),
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

  Future<Map<String, dynamic>> likeArticle(int feedId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postLikeData = {"feed_id": feedId, "engagement_type": "likes"};

    print('feedId$feedId');
    final response = await http.post(
      ApiUrls.LIKE_ARTICLE_URL + token,
      body: jsonEncode(postLikeData),
      headers: {'content-Type': 'application/json'},
    );
    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('like  $result');
      setBusy(false);
    } else {
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('like fail $result');
      setBusy(false);
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> relateQuery(int feedId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postRelateData = {"feed_id": feedId, "engagement_type": "relate"};

    print('feedId$feedId');
    final response = await http.post(
      ApiUrls.RELATE_QUERY_URL + token,
      body: jsonEncode(postRelateData),
      headers: {'content-Type': 'application/json'},
    );
    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('relate  $result');
      setBusy(false);
    } else {
      result = {'status': false, 'message': 'code ${response.statusCode} '};
      print('relate fail $result');
      setBusy(false);
    }
    return jsonDecode(response.body);
  }

  launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }
}
