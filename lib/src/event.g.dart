// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      eventType: json['eventType'] as String,
      from: json['from'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      event: json['event'] as Map<String, dynamic>,
    );
