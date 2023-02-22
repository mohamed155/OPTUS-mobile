class Todo {
  final int id;
  final String content;

  const Todo({
    required this.id,
    required this.content
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content
    };
  }

  @override
  toString() {
    return 'Todo{id: $id, content: $content}';
  }
}
