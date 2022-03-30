import 'package:json_annotation/json_annotation.dart';
import 'package:kinorca_event/src/interchange.dart';
import 'package:kinorca_event/src/iot_interchange.dart';

part 'event.g.dart';

/// Event data class
@JsonSerializable(createToJson: false)
class Event {
  /// Event type
  final String eventType;

  /// Passed from
  final String from;

  /// Emitted at
  final DateTime timestamp;

  /// Event data
  final Map<String, dynamic> event;

  /// Event constructor
  const Event({
    required this.eventType,
    required this.from,
    required this.timestamp,
    required this.event,
  });

  /// JSON to object converter
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  /// Get [InterchangeEvent] instance if event is interchange event
  InterchangeEvent? get interchangeEvent =>
      eventType == 'interchange' ? InterchangeEvent.fromJson(event) : null;

  /// Get [IotInterchangeEvent] instance if event is iot interchange event
  IotInterchangeEvent? get iotInterchangeEvent =>
      eventType == 'iotic' ? IotInterchangeEvent.fromJson(event) : null;
}
