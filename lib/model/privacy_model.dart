import 'package:json_annotation/json_annotation.dart';

part 'privacy_model.g.dart';

@JsonSerializable()
class PrivacyModel {
  PrivacyModel({
    this.status,
    this.data,
  });

  bool status;
  String data;

  factory PrivacyModel.fromJson(Map<String, dynamic> map) =>
      _$PrivacyModelFromJson(map);

  Map<String, dynamic> toJson() => _$PrivacyModelToJson(this);
}
