import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/reason_of_suspension.dart';
import 'package:owomaniya/model/health_details.dart';

part 'assigned_expert.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class AssignedExpert {

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
  String gender;

  @JsonKey(name: 'marital_status')
  String maritalStatus;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'state')
  dynamic state;

  @JsonKey(name: 'country')
  dynamic country;

  @JsonKey(name: 'user_image')
  String userImage;

  @JsonKey(name: 'health_details')
  HealthDetails healthDetails;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  @JsonKey(name: 'user_device_id')
  int userDevicesId;

  @JsonKey(name: 'pg_amount')
  int pgAmount;

  @JsonKey(name: 'reason_for_suspension')
  ReasonOfSuspension reasonForSuspension;

  @JsonKey(name: 'flagged')
  String flagged;

  @JsonKey(name: 'flag_note')
  dynamic flagNote;

  @JsonKey(name: 'user_url')
  String userUrl;

  @JsonKey(name: 'upload_url')
  String uploadUrl;

  @JsonKey(name: 'verified_mobile')
  int verifiedMobile;

  @JsonKey(name: 'verified_email')
  int verifiedEmail;

  AssignedExpert({
    this.id,
    this.emailAddress,
    this.mobileNo,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.maritalStatus,
    this.city,
    this.state,
    this.country,
    this.userImage,
    this.healthDetails,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userDevicesId,
    this.pgAmount,
    this.reasonForSuspension,
    this.flagged,
    this.flagNote,
    this.userUrl,
    this.uploadUrl,
    this.verifiedMobile,
    this.verifiedEmail,
  });

  factory AssignedExpert.fromJson(Map<String, dynamic> json) => _$AssignedExpertFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedExpertToJson(this);
// factory AssignedExpert.fromJson(Map<String, dynamic> json) => AssignedExpert(
//   id: json["id"],
//   emailAddress: json["email_address"],
//   mobileNo: json["mobile_no"],
//   firstName: json["first_name"],
//   lastName: json["last_name"],
//   dateOfBirth: DateTime.parse(json["date_of_birth"]),
//   gender: json["gender"],
//   maritalStatus: json["marital_status"],
//   city: json["city"],
//   state: json["state"],
//   country: json["country"],
//   userImage: json["user_image"],
//   healthDetails: HealthDetails.fromJson(json["health_details"]),
//   createdAt: DateTime.parse(json["created_at"]),
//   updatedAt: DateTime.parse(json["updated_at"]),
//   deletedAt: json["deleted_at"],
//   userDevicesId: json["user_devices_id"],
//   pgAmount: json["pg_amount"],
//   reasonForSuspension: json["reason_for_suspension"],
//   flagged: json["flagged"],
//   flagNote: json["flag_note"],
//   userUrl: json["user_url"],
//   uploadUrl: json["upload_url"],
//   verifiedMobile: json["verified_mobile"],
//   verifiedEmail: json["verified_email"],
// );
//
// Map<String, dynamic> toJson() => {
//   "id": id,
//   "email_address": emailAddress,
//   "mobile_no": mobileNo,
//   "first_name": firstName,
//   "last_name": lastName,
//   "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
//   "gender": gender,
//   "marital_status": maritalStatus,
//   "city": city,
//   "state": state,
//   "country": country,
//   "user_image": userImage,
//   "health_details": healthDetails.toJson(),
//   "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
//   "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//   "deleted_at": deletedAt,
//   "user_devices_id": userDevicesId,
//   "pg_amount": pgAmount,
//   "reason_for_suspension": reasonForSuspension,
//   "flagged": flagged,
//   "flag_note": flagNote,
//   "user_url": userUrl,
//   "upload_url": uploadUrl,
//   "verified_mobile": verifiedMobile,
//   "verified_email": verifiedEmail,
// };
}
