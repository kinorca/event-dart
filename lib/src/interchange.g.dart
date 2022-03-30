// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterchangeEvent _$InterchangeEventFromJson(Map<String, dynamic> json) =>
    InterchangeEvent(
      path: json['path'] as String,
      method: json['method'] as String,
      headersAll: (json['headersAll'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      query: (json['query'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      parameter: (json['parameter'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const <String, String>{},
      rawPath: json['rawPath'] as String,
      base64Body: json['base64Body'] as String,
      body: json['stringBody'] as String,
      objectBody: json['objectBody'],
    );

Map<String, dynamic> _$InterchangeResponseToJson(
        InterchangeResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'headersAll': instance.headersAll,
      'base64Body': instance.base64Body,
    };
