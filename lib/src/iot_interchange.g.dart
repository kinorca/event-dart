// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot_interchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IotInterchangeEvent _$IotInterchangeEventFromJson(Map<String, dynamic> json) =>
    IotInterchangeEvent(
      messageId: json['messageId'] as int,
      qos: json['qos'] as int,
      topic: json['topic'] as String,
      base64Payload: json['base64Payload'] as String,
      stringPayload: json['stringPayload'] as String?,
    );

Map<String, dynamic> _$IotInterchangeResponseToJson(
        IotInterchangeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
