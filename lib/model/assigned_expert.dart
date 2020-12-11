import 'package:owomaniya/model/health_details.dart';

class Assignedexpert {
  Assignedexpert({
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

  int id;
  String emailAddress;
  String mobileNo;
  String firstName;
  String lastName;
  DateTime dateOfBirth;
  String gender;
  String maritalStatus;
  String city;
  dynamic state;
  dynamic country;
  String userImage;
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
  String uploadUrl;
  int verifiedMobile;
  int verifiedEmail;

  factory Assignedexpert.fromJson(Map<String, dynamic> json) => Assignedexpert(
    id: json["id"],
    emailAddress: json["email_address"],
    mobileNo: json["mobile_no"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    gender: json["gender"],
    maritalStatus: json["marital_status"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    userImage: json["user_image"],
    healthDetails: HealthDetails.fromJson(json["health_details"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    userDevicesId: json["user_devices_id"],
    pgAmount: json["pg_amount"],
    reasonForSuspension: json["reason_for_suspension"],
    flagged: json["flagged"],
    flagNote: json["flag_note"],
    userUrl: json["user_url"],
    uploadUrl: json["upload_url"],
    verifiedMobile: json["verified_mobile"],
    verifiedEmail: json["verified_email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email_address": emailAddress,
    "mobile_no": mobileNo,
    "first_name": firstName,
    "last_name": lastName,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "marital_status": maritalStatus,
    "city": city,
    "state": state,
    "country": country,
    "user_image": userImage,
    "health_details": healthDetails.toJson(),
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
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
  };
}