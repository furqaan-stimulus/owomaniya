// To parse this JSON data, do
//
//     final postQuery = postQueryFromJson(jsonString);

import 'dart:convert';

PostQuery postQueryFromJson(String str) => PostQuery.fromJson(json.decode(str));

String postQueryToJson(PostQuery data) => json.encode(data.toJson());

class PostQuery {
  PostQuery({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory PostQuery.fromJson(Map<String, dynamic> json) => PostQuery(
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
    this.queryId,
    this.orderId,
    this.queryPrice,
  });

  String message;
  int queryId;
  int orderId;
  String queryPrice;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    queryId: json["query_id"],
    orderId: json["order_id"],
    queryPrice: json["query_price"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "query_id": queryId,
    "order_id": orderId,
    "query_price": queryPrice,
  };
}
