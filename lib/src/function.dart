import 'dart:async';
import 'dart:convert';

import 'package:kinorca_event/src/iot_interchange.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import 'event.dart';
import 'interchange.dart';

/// Interchange event handler
typedef InterchangeEventHandler = FutureOr<InterchangeResponse> Function(
    Event event, InterchangeEvent httpEvent);

/// IoT Interchange event handler
typedef IotInterchangeEventHandler = FutureOr<IotInterchangeResponse> Function(
    Event event, IotInterchangeEvent httpEvent);

/// Event handling class
class FunctionEvent {
  /// Interchange event handler
  final InterchangeEventHandler? interchange;

  /// IoT Interchange event handler
  final IotInterchangeEventHandler? iotInterchange;

  FunctionEvent({
    this.interchange,
    this.iotInterchange,
  });

  /// Start event handling
  Future<void> run() async {
    final router = Router();
    router.post('/v1/event', (Request request) async {
      final js = await request.readAsString();
      final event = Event.fromJson(jsonDecode(js));
      final icEvent = event.interchangeEvent;
      final ioticEvent = event.iotInterchangeEvent;

      if (icEvent != null) {
        final handler = interchange;
        if (handler != null) {
          final res = await handler(event, icEvent);
          final js = jsonEncode(res.toJson());
          return Response.ok(js);
        }
      } else if (ioticEvent != null) {
        final handler = iotInterchange;
        if (handler != null) {
          final res = await handler(event, ioticEvent);
          final js = jsonEncode(res.toJson());
          return Response.ok(js);
        }
      }
      return Response(502);
    });
    final server = await io.serve(router, '0.0.0.0', 80);
    print('Serving at ${server.address}:${server.port}');
  }
}
