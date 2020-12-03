import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/flagged.dart';
import 'package:owomaniya/Enums/gender.dart';
import 'package:owomaniya/Enums/marital_status.dart';
import 'package:owomaniya/Enums/reason_of_suspension.dart';
import 'package:owomaniya/Enums/user_status.dart';
import 'package:owomaniya/model/author_details.dart';
import 'package:owomaniya/model/feed_authors.dart';
import 'package:owomaniya/model/feeds.dart';
import 'package:owomaniya/model/user_devices.dart';

part 'users.g.dart';

@JsonSerializable(
    explicitToJson: true, includeIfNull: true, nullable: true, anyMap: true)
class Users {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'email_address')
  String emailAddress;

  @JsonKey(name: 'mobile_no')
  String mobileNo;

  @JsonKey(name: 'first_name')
  String firstName;

  @JsonKey(name: 'last_name')
  String lastName;

  @JsonKey(name: 'date_of_birth')
  DateTime dateOfBirth;

  @JsonKey(name: 'gender')
  Gender gender;

  @JsonKey(name: 'marital_status')
  String maritalStatus;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'user_image')
  String userImage;

  @JsonKey(name: 'health_details')
  String healthDetails;

  @JsonKey(name: 'user_status')
  String userStatus;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'remember_token')
  String rememberToken;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'created_by')
  String createdBy;

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  @JsonKey(name: 'updated_by')
  String updatedBy;

  @JsonKey(name: 'deleted_At')
  DateTime deletedAt;

  @JsonKey(name: 'user_devices_id')
  UserDevices userDevicesId;

  @JsonKey(name: 'pg_amount')
  String pgAmount;

  @JsonKey(name: 'reason_for_suspension')
  ReasonOfSuspension reasonForSuspension;

  @JsonKey(name: 'flagged')
  String flagged;

  @JsonKey(name: 'flag_note')
  String flagNote;

  @JsonKey(name: 'user_url')
  String userUrl;

  @JsonKey(name: 'upload_url')
  String uploadUrl;

  @JsonKey(name: 'verified_mobile')
  String verifiedMobile;

  @JsonKey(name: 'verified_email')
  String verifiedEmail;

  @JsonKey(name: 'authordetails')
  List<AuthorDetails> authorDetails;

  Users(
      {this.id,
      this.emailAddress,
      this.mobileNo,
      this.gender,
      this.password,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.maritalStatus,
      this.city,
      this.state,
      this.country,
      this.userImage,
      this.healthDetails,
      this.rememberToken,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt,
      this.userDevicesId,
      this.pgAmount,
      this.flagged,
      this.flagNote,
      this.reasonForSuspension,
      this.userUrl,
      this.uploadUrl,
      this.verifiedEmail,
      this.verifiedMobile,
      this.authorDetails,
      this.userStatus,});

  factory Users.fromJson(Map<String, dynamic> map) => _$UsersFromJson(map);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
