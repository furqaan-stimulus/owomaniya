import 'package:owomaniya/model/expert_details.dart';
import 'package:owomaniya/model/expert_expertise_mapping.dart';
import 'package:owomaniya/model/health_details.dart';
import 'package:owomaniya/model/user_author_detail.dart';

class User {
  String firstName;
  String emailAddress;
  String lastName;
  String mobileNo;
  int id;
  String userImage;
  String uploadUrl;
  List<UserAuthordetail> authordetails;
  String queryPrice;
  List<Expertexpertisemapping> expertexpertisemapping;
  Expertdetails expertdetails;
  DateTime dateOfBirth;
  String gender;
  String maritalStatus;
  String city;
  String state;
  String country;
  HealthDetails healthDetails;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int userDevicesId;
  int pgAmount;
  dynamic reasonForSuspension;
  String flagged;
  dynamic flagNote;
  String userUrl;
  int verifiedMobile;
  int verifiedEmail;
  String alternativeimage;

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
    this.authordetails,
    this.queryPrice,
    this.expertdetails,
    this.alternativeimage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        emailAddress: json["email_address"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        id: json["id"],
        userImage: json["user_image"],
        uploadUrl: json["upload_url"] == null ? null : json["upload_url"],
        authordetails:
            List<UserAuthordetail>.from(json["authordetails"].map((x) => UserAuthordetail.fromJson(x))),
        queryPrice: json["query_price"] == null ? null : json["query_price"],
        expertexpertisemapping: json["expertexpertisemapping"] == null
            ? null
            : List<Expertexpertisemapping>.from(
                json["expertexpertisemapping"].map((x) => Expertexpertisemapping.fromJson(x))),
        expertdetails: json["expertdetails"] == null ? null : Expertdetails.fromJson(json["expertdetails"]),
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"] as String),
        gender: json["gender"],
        maritalStatus: json["marital_status"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        healthDetails: json["health_details"] == null ? null : HealthDetails.fromJson(json["health_details"]),
        createdAt: json["created_at"]== null ? null :DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null :DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userDevicesId: json["user_devices_id"],
        pgAmount: json["pg_amount"],
        reasonForSuspension: json["reason_for_suspension"],
        flagged: json["flagged"],
        flagNote: json["flag_note"],
        userUrl: json["user_url"],
        verifiedMobile: json["verified_mobile"],
        verifiedEmail: json["verified_email"],
        alternativeimage: json["alternativeimage"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "email_address": emailAddress,
        "last_name": lastName == null ? null : lastName,
        "mobile_no": mobileNo == null ? null : mobileNo,
        "id": id,
        "user_image": userImage,
        "upload_url": uploadUrl == null ? null : uploadUrl,
        "authordetails": List<dynamic>.from(authordetails.map((x) => x.toJson())),
        "query_price": queryPrice == null ? null : queryPrice,
        "expertexpertisemapping": expertexpertisemapping == null
            ? null
            : List<dynamic>.from(expertexpertisemapping.map((x) => x.toJson())),
        "expertdetails": expertdetails == null ? null : expertdetails.toJson(),
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "marital_status": maritalStatus,
        "city": city,
        "state": state,
        "country": country,
        "user_image": userImage,
        "health_details": healthDetails.toJson(),
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "deleted_at": deletedAt,
        "user_devices_id": userDevicesId,
        "pg_amount": pgAmount,
        "reason_for_suspension": reasonForSuspension,
        "flagged": flagged,
        "flag_note": flagNote,
        "user_url": userUrl,
        "upload_url": uploadUrl,
        "verified_mobile": verifiedMobile,
        "verified_email": verifiedEmail,
        "alternativeimage": alternativeimage,
      };
}
