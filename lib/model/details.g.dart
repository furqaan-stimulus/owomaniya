// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Details _$DetailsFromJson(Map json) {
  return Details(
    (json['authordetails'] as List)
        ?.map((e) => e == null
            ? null
            : FeedAuthors.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'authordetails':
          instance.feedAuthorDetails?.map((e) => e?.toJson())?.toList(),
    };
