class Roles {
  String id;
  String roleName;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;

  Roles(
      {this.id,
      this.roleName,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt});

  factory Roles.fromJson(Map<String, dynamic> map) {
    return Roles(
      id: map['id'],
      roleName: map['role_name'],
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      updatedAt: map['update_at'],
      updatedBy: map['updated_by'],
      deletedAt: map['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_name'] = this.roleName;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
