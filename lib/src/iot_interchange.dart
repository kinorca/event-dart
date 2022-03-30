import 'package:json_annotation/json_annotation.dart';

part 'iot_interchange.g.dart';

/// IoT Interchange event
@JsonSerializable(createToJson: false)
class IotInterchangeEvent {
  /// Message ID
  final int messageId;

  /// QoS
  final int qos;

  /// Arrived topic
  final String topic;

  /// Base64 encoded Payload
  final String base64Payload;

  /// String payload if UTF8 parsable
  final String? stringPayload;

  /// Construct Iot Interchange event
  const IotInterchangeEvent({
    required this.messageId,
    required this.qos,
    required this.topic,
    required this.base64Payload,
    this.stringPayload,
  });

  /// JSON to [IotInterchangeEvent] converter
  factory IotInterchangeEvent.fromJson(Map<String, dynamic> json) =>
      _$IotInterchangeEventFromJson(json);
}

/// IoT Interchange response
@JsonSerializable(createFactory: false)
class IotInterchangeResponse {
  /// Response message (ignored)
  final String message;

  /// Construct with message
  IotInterchangeResponse.withMessage(this.message);

  /// Construct with OK
  IotInterchangeResponse.ok() : this.withMessage('ok');

  /// [IotInterchangeResponse] to JSON converter
  Map<String, dynamic> toJson() => _$IotInterchangeResponseToJson(this);
}
