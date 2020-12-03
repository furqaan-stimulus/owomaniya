import 'package:owomaniya/Enums/feed_status.dart';
import 'package:owomaniya/Enums/hidden.dart';
import 'package:owomaniya/Enums/is_anonymous.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FeedPreferences {
  // Future<bool> saveFeed(Feeds feed) async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //
  //   preferences.setInt('feed_id', feed.id);
  //   preferences.setString('feed_title', feed.feedTitle);
  //   preferences.setString('feed_date', feed.feedDate.toString());
  //   preferences.setString('feed_type', feed.feedType.toString());
  //   preferences.setString('feed_detail', feed.feedDetail);
  //   preferences.setInt('feed_like_cnt', feed.feedLikeCount);
  //   preferences.setInt('feed_share_cnt', feed.feedShareCount);
  //   preferences.setInt('feed_attendance_cnt', feed.feedAttendanceCount);
  //   preferences.setInt('feed_impression_cnt', feed.feedImpressionCount);
  //   preferences.setInt('feed_relate_cnt', feed.feedRelateCount);
  //   preferences.setString('feed_status', feed.feedStatus.toString());
  //   preferences.setString('is_anonymous', feed.isAnonymous.toString());
  //   preferences.setString('created_at', feed.createdAt.toString());
  //   preferences.setInt('created_by', feed.createdBy);
  //   preferences.setString('updated_at', feed.updatedAt.toString());
  //   preferences.setInt('updated_by', feed.updatedBy);
  //   preferences.setString('deleted_at', feed.deletedAt.toString());
  //   preferences.setString('hidden', feed.hidden.toString());
  //   // preferences.setString('user_device_id', feed.userDeviceId);
  //   preferences.setString('can_comment', feed.canComment.toString());
  //   preferences.setString('end_date', feed.endDate.toString());
  //   preferences.setString('feed_url', feed.feedUrl);
  //   preferences.setString('wp_id', feed.wpId.toString());
  //   return true;
  // }
  //
  // Future<Feeds> getFeed() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //
  //   int id = preferences.getInt('id');
  //   String feedTitle = preferences.getString('feed_title');
  //   String feedDate = preferences.getString('feed_date');
  //   String feedType = preferences.getString('feed_type');
  //   String feedDetail = preferences.getString('feed_detail');
  //   String feedLikeCount = preferences.getString('feed_like_cnt');
  //   String feedShareCount = preferences.getString('feed_share_cnt');
  //   String feedAttendanceCount = preferences.getString('feed_attendance_cnt');
  //   String feedImpressionCount = preferences.getString('feed_impression_cnt');
  //   String feedRelateCount = preferences.getString('feed_relate_cnt');
  //   FeedStatus feedStatus = preferences.get('feed_status');
  //   IsAnonymous isAnonymous = preferences.get('is_anonymous');
  //   String createdAt = preferences.getString('created_at');
  //   String createdBy = preferences.getString('created_by');
  //   String updatedAt = preferences.getString('updated_at');
  //   String updatedBy = preferences.getString('updated_by');
  //   String deletedAt = preferences.getString('deleted_at');
  //   String userDeviceId = preferences.getString('user_device_id');
  //   Hidden hidden = preferences.get('hidden');
  //   String canComment = preferences.getString('can_comment');
  //   String endDate = preferences.getString('end_date');
  //   String feedUrl = preferences.getString('feed_url');
  //   String wpId = preferences.getString('wp_id');
  //
  //   // return Feeds(
  //   //   id: id,
  //   //   feedTitle: feedTitle,
  //   //   feedDate: feedDate,
  //   //   feedType: feedType,
  //   //   feedDetail: feedDetail,
  //   //   feedLikeCount: feedLikeCount,
  //   //   feedShareCount: feedShareCount,
  //   //   feedAttendanceCount: feedAttendanceCount,
  //   //   feedRelateCount: feedRelateCount,
  //   //   feedImpressionCount: feedImpressionCount,
  //   //   feedStatus: feedStatus,
  //   //   isAnonymous: isAnonymous,
  //   //   createdAt: createdAt,
  //   //   createdBy: createdBy,
  //   //   updatedAt: updatedAt,
  //   //   updatedBy: updatedBy,
  //   //   deletedAt: deletedAt,
  //   //   userDeviceId: userDeviceId,
  //   //   hidden: hidden,
  //   //   canComment: canComment,
  //   //   endDate: endDate,
  //   //   feedUrl: feedUrl,
  //   //   wpId: wpId,
  //   // );
  // }

  void removeFeed() {}
}
