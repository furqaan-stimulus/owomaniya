// To parse this JSON data, do
//
//     final removeBookmark = removeBookmarkFromJson(jsonString);

import 'dart:convert';

RemoveBookmark removeBookmarkFromJson(String str) => RemoveBookmark.fromJson(json.decode(str));

String removeBookmarkToJson(RemoveBookmark data) => json.encode(data.toJson());

class RemoveBookmark {
  RemoveBookmark({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory RemoveBookmark.fromJson(Map<String, dynamic> json) => RemoveBookmark(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.message,
  });

  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
