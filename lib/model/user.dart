import 'package:json_annotation/json_annotation.dart';
import 'package:owomaniya/Enums/reason_of_suspension.dart';
import 'package:owomaniya/model/expert_detail.dart';
import 'package:owomaniya/model/expert_expertise_mapping.dart';
import 'package:owomaniya/model/health_details.dart';
import 'package:owomaniya/model/user_author_detail.dart';

part 'user.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: true,
  nullable: true,
  anyMap: true,
)
class User {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "first_name")
  String firstName;
  @JsonKey(name: "email_address")
  String emailAddress;
  @JsonKey(name: "last_name")
  String lastName;
  @JsonKey(name: "mobile_no")
  String mobileNo;
  @JsonKey(name: "user_image")
  String userImage;
  @JsonKey(name: "upload_url")
  String uploadUrl;
  @JsonKey(name: "authordetails")
  List<UserAuthorDetail> authorDetails;
  @JsonKey(name: "query_price")
  String queryPrice;
  @JsonKey(name: "expertexpertisemapping")
  List<ExpertExpertiseMapping> expertexpertisemapping;
  @JsonKey(name: "expertdetails")
  ExpertDetail expertDetails;
  @JsonKey(name: "date_of_birth")
  DateTime dateOfBirth;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "marital_status")
  String maritalStatus;
  @JsonKey(name: "city")
  String city;
  @JsonKey(name: "state")
  String state;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "health_details")
  HealthDetails healthDetails;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "deleted_at")
  dynamic deletedAt;
  @JsonKey(name: "user_devices_id")
  int userDevicesId;
  @JsonKey(name: "pg_amount")
  int pgAmount;
  @JsonKey(name: "reason_for_suspension")
  ReasonOfSuspension reasonForSuspension;
  @JsonKey(name: "flagged")
  String flagged;
  @JsonKey(name: "flag_note")
  dynamic flagNote;
  @JsonKey(name: "user_url")
  String userUrl;
  @JsonKey(name: "verified_mobile")
  int verifiedMobile;
  @JsonKey(name: "verified_email")
  int verifiedEmail;
  @JsonKey(name: "alternativeimage")
  String alternativeImage;

  User({
    this.id,
    this.emailAddress,
    this.mobileNo,
    this.gender,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
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
    this.flagged,
    this.flagNote,
    this.reasonForSuspension,
    this.userUrl,
    this.uploadUrl,
    this.verifiedEmail,
    this.verifiedMobile,
    this.expertexpertisemapping,
    this.authorDetails,
    this.queryPrice,
    this.expertDetails,
    this.alternativeImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

// factory User.fromJson(Map<String, dynamic> json) => User(
//       firstName: json["first_name"],
//       emailAddress: json["email_address"],
//       lastName: json["last_name"] == null ? null : json["last_name"],
//       mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
//       id: json["id"],
//       userImage: json["user_image"],
//       uploadUrl: json["upload_url"] == null ? null : json["upload_url"],
//       authordetails:
//           List<UserAuthordetail>.from(json["authordetails"].map((x) => UserAuthordetail.fromJson(x))),
//       queryPrice: json["query_price"] == null ? null : json["query_price"],
//       expertexpertisemapping: json["expertexpertisemapping"] == null
//           ? null
//           : List<ExpertExpertiseMapping>.from(
//               json["expertexpertisemapping"].map((x) => ExpertExpertiseMapping.fromJson(x))),
//       expertdetails: json["expertdetails"] == null ? null : ExpertDetail.fromJson(json["expertdetails"]),
//       dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"] as String),
//       gender: json["gender"],
//       maritalStatus: json["marital_status"],
//       city: json["city"],
//       state: json["state"],
//       country: json["country"],
//       healthDetails: json["health_details"] == null ? null : HealthDetails.fromJson(json["health_details"]),
//       createdAt: json["created_at"]== null ? null :DateTime.parse(json["created_at"]),
//       updatedAt: json["updated_at"] == null ? null :DateTime.parse(json["updated_at"]),
//       deletedAt: json["deleted_at"],
//       userDevicesId: json["user_devices_id"],
//       pgAmount: json["pg_amount"],
//       reasonForSuspension: json["reason_for_suspension"],
//       flagged: json["flagged"],
//       flagNote: json["flag_note"],
//       userUrl: json["user_url"],
//       verifiedMobile: json["verified_mobile"],
//       verifiedEmail: json["verified_email"],
//       alternativeimage: json["alternativeimage"],
//     );
//
// Map<String, dynamic> toJson() => {
//       "first_name": firstName,
//       "email_address": emailAddress,
//       "last_name": lastName == null ? null : lastName,
//       "mobile_no": mobileNo == null ? null : mobileNo,
//       "id": id,
//       "user_image": userImage,
//       "upload_url": uploadUrl == null ? null : uploadUrl,
//       "authordetails": List<dynamic>.from(authordetails.map((x) => x.toJson())),
//       "query_price": queryPrice == null ? null : queryPrice,
//       "expertexpertisemapping": expertexpertisemapping == null
//           ? null
//           : List<dynamic>.from(expertexpertisemapping.map((x) => x.toJson())),
//       "expertdetails": expertdetails == null ? null : expertdetails.toJson(),
//       "date_of_birth":
//           "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
//       "gender": gender,
//       "marital_status": maritalStatus,
//       "city": city,
//       "state": state,
//       "country": country,
//       "user_image": userImage,
//       "health_details": healthDetails.toJson(),
//       "created_at":
//           "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
//       "updated_at":
//           "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
//       "deleted_at": deletedAt,
//       "user_devices_id": userDevicesId,
//       "pg_amount": pgAmount,
//       "reason_for_suspension": reasonForSuspension,
//       "flagged": flagged,
//       "flag_note": flagNote,
//       "user_url": userUrl,
//       "upload_url": uploadUrl,
//       "verified_mobile": verifiedMobile,
//       "verified_email": verifiedEmail,
//       "alternativeimage": alternativeimage,
//     };
}
