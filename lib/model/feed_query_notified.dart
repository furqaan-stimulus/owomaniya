class FeedQueryNotified {
  String id;
  String feedsId;
  String notifiedUsersExpertId;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;

  FeedQueryNotified({
    this.id,
    this.feedsId,
    this.notifiedUsersExpertId,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  factory FeedQueryNotified.fromJson(Map<String, dynamic> map) {
    return FeedQueryNotified(
      id: map['id'],
      feedsId: map['feeds_id'],
      notifiedUsersExpertId: map['notified_users_expert_id'],
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      updatedAt: map['updated_at'],
      updatedBy: map['updated_by'],
      deletedAt: map['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['feeds_id'] = this.feedsId;
    data['notified_users_expert_id'] = this.notifiedUsersExpertId;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
