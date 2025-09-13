import 'package:dio/dio.dart';
import 'package:flutter_tech_task/repository/comments/comment.dart';
import 'package:flutter_tech_task/repository/common/api_client.dart';
import 'package:flutter_tech_task/repository/common/response_parsers.dart';
import 'package:flutter_tech_task/repository/posts/post.dart';

/// JsonPlaceholder API Controller.
class ApiController {
  const ApiController({required this.client});

  /// Instance of [ApiClient].
  final ApiClient client;

  /// Gets a list of all the comments for the post by [postId]
  Future<List<Comment>> getComments(
    CancelToken? ct, {
    required String postId,
  }) async {
    final data = await client.getRequest('/posts/$postId/comments', ct);

    return parseListResponse<Comment>(data, (json) => Comment.fromJson(json));
  }

  /// Gets all posts.
  Future<List<Post>> getAllPosts(CancelToken? ct) async {
    final data = await client.getRequest('/posts', ct);

    return parseListResponse(data, (json) => Post.fromJson(json));
  }

  /// Gets a post by its [postId].
  Future<Post> getSinglePost(CancelToken? ct, {required String postId}) async {
    final data = await client.getRequest('/posts/$postId', ct);

    return parseSingleResponse<Post>(data, (json) => Post.fromJson(json));
  }
}
