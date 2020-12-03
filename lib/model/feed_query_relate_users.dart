class FeedQueryRelateUsers {
  String id;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;
  String feedsId;
  String usersId;

  FeedQueryRelateUsers({
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.feedsId,
    this.usersId,
  });

  factory FeedQueryRelateUsers.fromJson(Map<String, dynamic> map) {
    return FeedQueryRelateUsers(
      id: map['id'],
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      updatedAt: map['updated_at'],
      updatedBy: map['updated_by'],
      deletedAt: map['deleted_at'],
      feedsId: map['feeds_id'],
      usersId: map['users_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    data['feeds_id'] = this.feedsId;
    data['users_id'] = this.usersId;
    return data;
  }
}
