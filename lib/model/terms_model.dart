
import 'package:json_annotation/json_annotation.dart';

part 'terms_model.g.dart';


@JsonSerializable()
class TermsModel{
  TermsModel({
    this.status,
    this.data,
  });

  bool status;
  String data;

  factory TermsModel.fromJson(Map<String, dynamic> map) =>
      _$TermsModelFromJson(map);

  Map<String, dynamic> toJson() => _$TermsModelToJson(this);
}