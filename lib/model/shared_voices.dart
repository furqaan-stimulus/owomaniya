import 'package:owomaniya/Enums/story_status.dart';
import 'package:owomaniya/model/user.dart';

class SharedVoices {
  String id;
  User usersId;
  String shortStory;
  String aboutYou;
  StoryStatus status;
  String publishedOn;
  String createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  String deletedAt;

  SharedVoices({
    this.id,
    this.usersId,
    this.shortStory,
    this.aboutYou,
    this.status,
    this.publishedOn,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
  });

  factory SharedVoices.fromJson(Map<String, dynamic> map) {
    return SharedVoices(
      id: map['id'],
      usersId: map['users_id'],
      shortStory: map['short_story'],
      aboutYou: map['about_you'],
      status: map['status'],
      publishedOn: map['published_on'],
      createdAt: map['created_at'],
      createdBy: map['created_by'],
      updatedBy: map['updated_by'],
      updatedAt: map['updated_at'],
      deletedAt: map['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.usersId;
    data['short_story'] = this.shortStory;
    data['about_you'] = this.aboutYou;
    data['status'] = this.status;
    data['published_on'] = this.publishedOn;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
