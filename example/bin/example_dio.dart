import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sse_stream/sse_stream.dart';

Future<void> main(List<String> arguments) async {
  final baseUrl = 'https://example.com';
  final path = '/sse';
  final data = <String, Object?>{
    'some': 'test',
    'data': 'here',
  };

  final dio = Dio()..options.baseUrl = baseUrl;
  final Response<ResponseBody> resp = await dio.post(
    path,
    data: data,
    options: Options(responseType: ResponseType.stream),
  );
  resp.data?.stream
      .cast<List<int>>()
      .transform(Utf8Decoder())
      .transform(const SseEventTransformer())
      .listen((event) {
    // do something here
    print('new event: $event');
  });
}
