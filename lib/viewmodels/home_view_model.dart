import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:owomaniya/app/locator.dart';
import 'package:owomaniya/app/router.gr.dart' as route;
import 'package:owomaniya/model/feed_comments.dart';
import 'package:owomaniya/model/feed_item_model.dart';
import 'package:owomaniya/utils/api_urls.dart';
import 'package:owomaniya/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:owomaniya/model/user_profile.dart';

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

  Future<FeedItemModel> loadFeed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    if (_token == null) {
      response = await http.get(ApiUrls.GET_FEEDS_WITHOUT_TOKEN_URL);
      final jsonString = json.decode(response.body);
      FeedItemModel model = FeedItemModel.fromJson(jsonString);
      return model;
    } else {
      response = await http.get(ApiUrls.GET_FEEDS_WITH_TOKEN_URL + token + ApiUrls.PAGE_NO);
      final jsonString = json.decode(response.body);
      FeedItemModel model = FeedItemModel.fromJson(jsonString);
      return model;
    }
  }

  Future<FeedComments> getComments() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    http.Response response;
    if (_token != null) {
      response = await http.get(ApiUrls.GET_FEED_COMMENT_URL + token + ApiUrls.FEED_NO);
      final jsonString = json.decode(response.body);
      FeedComments model = FeedComments.fromJson(jsonString);
      return model;
    }
    return jsonDecode(response.body);
  }

  Future<UserProfile> getUserProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
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

  Future<Map<String, dynamic>> postBookmark(int feedId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postBookmarkData = {"feed_id": feedId};

    print('feedId$feedId');
    final response = await http.post(
      ApiUrls.ADD_BOOKMARK_URL + token,
      body: jsonEncode(postBookmarkData),
      headers: {'content-Type': 'application/json'},
    );
    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('bookmark  $result');
      setBusy(false);
    } else {
      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
      setBusy(false);
    }

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
      print('bookmark  $result');
      setBusy(false);
    } else {
      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
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
      print('bookmark  $result');
      setBusy(false);
    } else {
      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
      setBusy(false);
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> postFeedComment(
    int feedId,
    String comment,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final Map<String, dynamic> postFeedCommentData = {
      "feed_id": feedId,
      "comment": comment,
      "device_type": 'mobile',
      "device_os": ' android',
      "is_anonymous": "Y"
    };

    print('feedId$feedId');
    final response = await http.post(
      ApiUrls.POST_FEED_COMMENT_URL + token,
      body: jsonEncode(postFeedCommentData),
      headers: {'content-Type': 'application/json'},
    );
    var result;
    if (response.statusCode == 200) {
      result = {'status': true, 'message': 'code ${response.body} '};
      print('bookmark  $result');
      setBusy(false);
    } else {
      result = {'status': true, 'message': 'code ${response.statusCode} '};
      print('bookmark fail $result');
      setBusy(false);
    }
    return jsonDecode(response.body);
  }
}
