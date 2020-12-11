import 'package:intl/intl.dart';

class DateTimeAgo {
  static String formatDate(String dateString) {
    var inputDate = DateFormat("yyyy-MM-dd h:mm:ss");
    var date1 = inputDate.parse(dateString);
    var outputDate = DateFormat("dd MMM yyyy");
    var date2 = outputDate.format(date1);
    return date2.toString();
  }

  static String timeAgoSinceDate(String dateString, {bool numericDates = true}) {
    DateTime notificationDate = DateFormat("yyyy-MM-dd h:mm:ss").parse(dateString);
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);

    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes <= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours <= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays <= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inDays < 6) {
      return '${difference.inDays} days ago';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if ((difference.inDays / 7).ceil() < 4) {
      return '${(difference.inDays / 7).ceil()} weeks ago';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 30).ceil() < 30) {
      return '${(difference.inDays / 30).ceil()} months ago';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    }
    return '${(difference.inDays / 365).floor()} years ago';
  }
}
