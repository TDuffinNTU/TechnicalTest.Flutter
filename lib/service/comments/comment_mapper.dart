import 'package:flutter_tech_task/repository/models/comments/comment_model.dart';
import 'package:flutter_tech_task/service/comments/comment.dart';
import 'package:flutter_tech_task/service/common/mapper_mixin.dart';

class CommentMapper with MapperMixin<Comment, CommentModel> {
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
