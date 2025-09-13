import 'package:dio/dio.dart';

final Dio _dio = Dio(
  BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
);

/// Common API methods, implemented with [Dio].
/// Wrapped for mocking in mockito.
class ApiClient {
  Future<Map<String, dynamic>> getRequest(String path, CancelToken? ct) async {
    final response = await _dio.get(path);
    return {'data': response.data!};
  }

  // Imagine there are post/put/patch etc. here!
}
