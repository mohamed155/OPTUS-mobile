class Todo {
  const Todo({
    required this.id,
    required this.content,
  });

  final int id;
  final String content;

  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content};
  }

  @override
  String toString() {
    return 'Todo{id: $id, content: $content}';
  }
}
