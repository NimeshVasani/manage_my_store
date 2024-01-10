abstract class Resources<T> {
  final T? data;
  final String? message;

  Resources({this.data, this.message});
}

class Success<T> extends Resources<T> {
  Success(T data) : super(data: data);
}

class Error<T> extends Resources<T> {
  Error(String message, {T? data}) : super(data: data, message: message);
}

class Loading<T> extends Resources<T> {
  Loading() : super();
}
