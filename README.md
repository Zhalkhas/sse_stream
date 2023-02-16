# Dart SSE Stream

Just simple package which parses SSE from text stream I wrote for myself

## Usage

Basically, package gives SseEventTransformer, which accepts Stream<String>

```dart
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
    },
);
```

This example shows how to parse data from [Dio](https://pub.dev/packages/dio) response, example folder contains sample for [http](https://pub.dev/packages/http) package