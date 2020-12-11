// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

import 'package:owomaniya/model/health_details.dart';
import 'package:owomaniya/model/user.dart';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
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
    this.alternativeimage,
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
  String state;
  String country;
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
  String alternativeimage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        alternativeimage: json["alternativeimage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email_address": emailAddress,
        "mobile_no": mobileNo,
        "first_name": firstName,
        "last_name": lastName,
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

class HealthDetails {
  HealthDetails({
    this.height,
    this.weight,
    this.heightunit,
    this.weightunit,
    this.bloodGroup,
    this.bmi,
  });

  int height;
  int weight;
  String heightunit;
  String weightunit;
  String bloodGroup;
  int bmi;

  factory HealthDetails.fromJson(Map<String, dynamic> json) => HealthDetails(
        height: json["height"],
        weight: json["weight"],
        heightunit: json["heightunit"],
        weightunit: json["weightunit"],
        bloodGroup: json["blood_group"],
        bmi: json["bmi"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "weight": weight,
        "heightunit": heightunit,
        "weightunit": weightunit,
        "blood_group": bloodGroup,
        "bmi": bmi,
      };
}
