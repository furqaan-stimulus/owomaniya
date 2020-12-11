// To parse this JSON data, do
//
//     final addBookmark = addBookmarkFromJson(jsonString);

import 'dart:convert';

AddBookmark addBookmarkFromJson(String str) => AddBookmark.fromJson(json.decode(str));

String addBookmarkToJson(AddBookmark data) => json.encode(data.toJson());

class AddBookmark {
  AddBookmark({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory AddBookmark.fromJson(Map<String, dynamic> json) => AddBookmark(
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
