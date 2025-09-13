import 'package:dio/dio.dart';
import 'package:flutter_tech_task/repository/comments/comment.dart';
import 'package:flutter_tech_task/repository/common/api_client.dart';
import 'package:flutter_tech_task/repository/common/response_parsers.dart';

/// JsonPlaceholder API Controller.
class ApiController {
  final ApiClient client = ApiClient();

  /// Gets a list of all the comments for the post under [postId]
  Future<List<Comment>> getComments(
    CancelToken? ct, {
    required String postId,
  }) async {
    final data = await client.getRequest('/post/$postId/comments', ct);

    return parseListResponse<Comment>(data, (json) => Comment.fromJson(json));
  }
}
