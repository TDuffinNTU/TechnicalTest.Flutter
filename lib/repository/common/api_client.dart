import 'package:dio/dio.dart';

final Dio _dio = Dio(
  BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
);

/// Common API methods, wrapped for mocking.
class ApiClient {
  Future<List<dynamic>> getRequest(CancelToken? ct, String path) async {
    final response = await _dio.get<List<dynamic>>(path);
    return response.data!;
  }
}
