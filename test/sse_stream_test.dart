import 'package:sse_stream/sse_stream.dart';
import 'package:test/test.dart';

void main() {
  test('basic data event parsing test', () {
    final eventData = 'some mock data here';
    final text = 'data: $eventData\n\n';
    final actual = Stream.fromIterable([text]).transform(SseEventTransformer());
    expect(
        actual,
        emitsInAnyOrder([
          SseEvent(data: eventData),
          emitsDone,
        ]));
  });
}
