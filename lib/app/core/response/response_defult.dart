class DefaultResponse<T> {
  final T object;
  String message;
  final bool success;

  DefaultResponse({this.object, this.message, this.success});

  DefaultResponse.Error({this.object, this.message, this.success = false});

  DefaultResponse.Success({this.object, this.message, this.success = true});
}
