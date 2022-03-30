import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'interchange.g.dart';

/// Interchange event data
@JsonSerializable(createToJson: false)
class InterchangeEvent {
  /// Requested path
  final String path;

  /// Requested method
  final String method;

  /// All headers
  final Map<String, List<String>> headersAll;

  /// Query parameters
  final Map<String, List<String>> query;

  /// Path placeholder parameters
  final Map<String, String> parameter;

  /// Raw path
  final String rawPath;

  /// Base64 encoded body
  final String base64Body;

  /// String body
  @JsonKey(name: "stringBody")
  final String body;

  /// Object parsed body if Content-Type == application/json
  final Object? objectBody;

  /// Interchange event constructor
  const InterchangeEvent({
    required this.path,
    required this.method,
    required this.headersAll,
    required this.query,
    this.parameter = const <String, String>{},
    required this.rawPath,
    required this.base64Body,
    required this.body,
    required this.objectBody,
  });

  /// JSON to [InterchangeEvent] converter
  factory InterchangeEvent.fromJson(Map<String, dynamic> json) =>
      _$InterchangeEventFromJson(json);
}

/// Interchange event response
@JsonSerializable(createFactory: false)
class InterchangeResponse {
  static const defaultStatusCode = 200;

  /// Response status code
  final int statusCode;

  /// Response header
  final Map<String, List<String>> headersAll;

  /// Response body
  final String base64Body;

  /// Construct from Base64 body
  InterchangeResponse.fromBase64Body({
    this.statusCode = defaultStatusCode,
    Map<String, List<String>>? headersAll,
    required this.base64Body,
  }) : headersAll = headersAll ?? {};

  /// Construct from Raw bytes body
  InterchangeResponse.fromRawBytes({
    int statusCode = defaultStatusCode,
    Map<String, List<String>>? headersAll,
    required List<int> raw,
  }) : this.fromBase64Body(
          statusCode: statusCode,
          headersAll: headersAll,
          base64Body: base64Encode(raw),
        );

  /// Construct from String data
  InterchangeResponse.fromStringBody({
    int statusCode = defaultStatusCode,
    Map<String, List<String>>? headersAll,
    required String string,
  }) : this.fromRawBytes(
          statusCode: statusCode,
          headersAll: headersAll,
          raw: utf8.encode(string),
        );

  /// Construct from JSON response body
  InterchangeResponse.fromJsonBody({
    int statusCode = defaultStatusCode,
    Map<String, List<String>>? headersAll,
    required dynamic json,
  }) : this.fromStringBody(
          statusCode: statusCode,
          headersAll: (headersAll ?? {})
            ..addAll({
              'Content-Type': ['application/json']
            }),
          string: jsonEncode(json),
        );

  /// Convert to JSON object
  Map<String, dynamic> toJson() => _$InterchangeResponseToJson(this);
}
