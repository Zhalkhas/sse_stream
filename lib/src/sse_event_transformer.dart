import 'dart:async';

import 'sse_event.dart';
import 'sse_event_collector.dart';
import 'sse_event_parser.dart';

/// A [StreamTransformer] that accepts decoded response body as [String]
/// and decodes them to [SseEvent]s.
class SseEventTransformer extends StreamTransformerBase<String, SseEvent> {
  const SseEventTransformer();
  @override
  Stream<SseEvent> bind(Stream<String> stream) =>
      stream.transform(SseEventCollector()).transform(const SseEventParser());
}
