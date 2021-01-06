// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map json) {
  return Detail(
    authorDetails: (json['authordetails'] as List)
        ?.map((e) => e == null
            ? null
            : AuthorDetail.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    otherDetails: json['otherdetails'] as List,
  );
}

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'authordetails':
          instance.authorDetails?.map((e) => e?.toJson())?.toList(),
      'otherdetails': instance.otherDetails,
    };
