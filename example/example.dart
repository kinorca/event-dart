import 'package:kinorca_event/kinorca_event.dart';

Future<void> main() async {
  final event = FunctionEvent(
    interchange: (Event event, InterchangeEvent ic) {
      return InterchangeResponse.fromJsonBody(
        json: {
          'message': 'ok',
        },
      );
    },
    iotInterchange: (Event event, IotInterchangeEvent iic) {
      return IotInterchangeResponse.ok();
    },
  );

  await event.run();
}
