class ForbiddenJobException implements Exception {
  ForbiddenJobException(this.message);

  final String message;

  @override
  String toString() => message;
}
