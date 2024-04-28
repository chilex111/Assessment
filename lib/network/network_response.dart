abstract class NetworkResponse<T> {
  final T? data;
  final T? tx;
  final String? error;

  const NetworkResponse({this.data, this.tx, this.error});
}

class NetworkSuccess<T> extends NetworkResponse<T> {
  const NetworkSuccess(T? data) : super(data: data);
}

class NetworkTXSuccess<T> extends NetworkResponse<T> {
  const NetworkTXSuccess(T? tx) : super(tx: tx);
}

class NetworkError<T> extends NetworkResponse<T> {
  const NetworkError(String? error) : super(error: error);
}