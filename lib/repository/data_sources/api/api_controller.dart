import 'package:dio/dio.dart';
import 'package:flutter_tech_task/repository/models/comments/comment_model.dart';
import 'package:flutter_tech_task/repository/data_sources/api/api_client.dart';
import 'package:flutter_tech_task/repository/common/response_parsers.dart';
import 'package:flutter_tech_task/repository/models/posts/post_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_controller.g.dart';

/// JsonPlaceholder API Controller.
class ApiController {
  const ApiController({required this.client});

  /// Instance of [ApiClient].
  final ApiClient client;

  /// Gets a list of all the comments for the post by [postId]
  Future<List<CommentModel>> getComments({
    CancelToken? ct,
    required int postId,
  }) async {
    final data = await client.getRequest('/posts/$postId/comments', ct);

    return parseListResponse<CommentModel>(
      data,
      (json) => CommentModel.fromJson(json),
    );
  }

  /// Gets all posts.
  Future<List<PostModel>> getAllPosts({CancelToken? ct}) async {
    final data = await client.getRequest('/posts', ct);

    return parseListResponse(data, (json) => PostModel.fromJson(json));
  }

  /// Gets a post by its [postId].
  Future<PostModel> getSinglePost({
    CancelToken? ct,
    required int postId,
  }) async {
    final data = await client.getRequest('/posts/$postId', ct);

    return parseSingleResponse<PostModel>(
      data,
      (json) => PostModel.fromJson(json),
    );
  }
}

@riverpod
FutureOr<ApiController> getApiController(Ref ref) async {
  return ApiController(client: await ref.watch(apiClientProvider.future));
}
