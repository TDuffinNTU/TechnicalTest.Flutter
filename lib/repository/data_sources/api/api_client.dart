import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'api_client.g.dart';

/// Common API methods, implemented with [Dio].
/// Wrapped for mocking in mockito.
class ApiClient {
  ApiClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          contentType: ContentType.json.toString(),
          responseType: ResponseType.json,
        ),
      );
  final Dio dio;
  Future<Map<String, dynamic>> getRequest(String path, CancelToken? ct) async {
    final Response response = await dio.get(path);
    return {'data': response.data!};
  }

  // Imagine there are post/put/patch etc. here!
}

/// Singleton instance of our client.
@Riverpod(keepAlive: true)
FutureOr<ApiClient> apiClient(Ref ref) {
  return ApiClient();
}
