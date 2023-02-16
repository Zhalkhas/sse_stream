import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sse_stream/sse_stream.dart';

Future<void> main() async {
  final baseUrl = 'https://example.com';
  final path = '/sse';
  final data = <String, Object?>{
    'some': 'test',
    'data': 'here',
  };

  final client = http.Client();
  final http.StreamedResponse resp = await client.send(
    http.Request(
      'POST',
      Uri.parse(baseUrl + path),
    )..body = jsonEncode(data),
  );
  resp.stream
      .transform(Utf8Decoder())
      .transform(const SseEventTransformer())
      .listen((event) {
    print('new event: $event');
  });
}
