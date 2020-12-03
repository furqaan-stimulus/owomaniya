class Tags {
  String id;
  String tags;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;

  Tags({
    this.id,
    this.tags,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  factory Tags.fromJson(Map<String, dynamic> map) {
    return Tags(
      id: map['id'],
      tags: map['tags'],
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
    data['tags'] = this.tags;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
