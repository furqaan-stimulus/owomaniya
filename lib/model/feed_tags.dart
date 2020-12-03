class FeedTags {
  String id;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;
  String tagsId;
  String feedsId;

  FeedTags({
    this.id,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.tagsId,
    this.feedsId,
  });

  factory FeedTags.fromJson(Map<String, dynamic> map) {
    return FeedTags(
      id: map['id'],
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      updatedAt: map['updated_at'],
      updatedBy: map['updated_by'],
      deletedAt: map['deleted_at'],
      tagsId: map['tags_id'],
      feedsId: map['feeds_id'],
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
    data['tags_id'] = this.tagsId;
    data['feeds_id'] = this.feedsId;
    return data;
  }
}
