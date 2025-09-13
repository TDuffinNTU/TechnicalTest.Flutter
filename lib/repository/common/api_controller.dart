import 'package:dio/dio.dart';
import 'package:flutter_tech_task/repository/comments/comment.dart';
import 'package:flutter_tech_task/repository/common/api_client.dart';
import 'package:flutter_tech_task/repository/common/response_parsers.dart';

class ApiController {
  final ApiClient client = ApiClient();

  Future<List<Comment>> getComments(
    CancelToken? ct, {
    required String postId,
  }) async {
    final data = await client.getRequest(ct, '/post/$postId/comments');

    return parseListResponse<Comment>(data, (json) => Comment.fromJson(json));
  }
}
