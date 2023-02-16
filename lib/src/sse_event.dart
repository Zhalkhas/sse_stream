/// Data class for SSE events
class SseEvent {
  final String? id;
  final String? name;
  final String? data;

  const SseEvent({this.id, this.name, this.data});

  @override
  String toString() => 'id: $id name: $name data: $data';
}
