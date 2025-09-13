import 'package:dio/dio.dart';

final Dio _dio = Dio(
  BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
);

/// Common API methods, implemented with [Dio].
/// Wrapped for mocking in mockito.
class ApiClient {
  Future<List<dynamic>> getRequest(String path, CancelToken? ct) async {
    final response = await _dio.get<List<dynamic>>(path);
    return List.castFrom<dynamic, Map<String, dynamic>>(response.data!);
  }

  // Imagine there are post/put/patch etc. here!
}
