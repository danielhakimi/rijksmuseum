class ResponseFailure extends Error {
  final String message;

  ResponseFailure(this.message);

  @override
  String toString() => message;
}
