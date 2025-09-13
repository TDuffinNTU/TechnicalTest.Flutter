import 'package:flutter_tech_task/repository/data_sources/database/api_client.dart';
import 'package:flutter_tech_task/repository/data_sources/database/api_controller.dart';
import 'package:flutter_tech_task/repository/models/comments/comment_model.dart';
import 'package:flutter_tech_task/service/comments/comment.dart';
import 'package:flutter_tech_task/service/common/mapper_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_service.g.dart';

@riverpod
class CommentService extends _$CommentService
    with MapperMixin<Comment, CommentModel> {
  @override
  FutureOr<List<Comment>> build(int postId) async {
    await Future.delayed(Duration(seconds: 3));
    final List<CommentModel> comments = await ApiController(
      client: ApiClient(),
    ).getComments(postId: postId);
    return comments.map(fromRepository).toList();
  }

  @override
  Comment fromRepository(CommentModel comment) {
    return Comment(
      postId: comment.postId,
      id: comment.id,
      name: comment.name,
      email: comment.email,
      body: comment.body,
    );
  }

  @override
  CommentModel toRepository(Comment comment) {
    return CommentModel(
      postId: comment.postId,
      id: comment.id,
      name: comment.name,
      email: comment.email,
      body: comment.body,
    );
  }
}
