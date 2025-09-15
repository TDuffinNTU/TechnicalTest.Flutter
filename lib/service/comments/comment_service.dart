import 'package:flutter_tech_task/repository/data_sources/api/api_controller.dart';
import 'package:flutter_tech_task/repository/data_sources/database/database_controller.dart';
import 'package:flutter_tech_task/repository/models/comments/comment_model.dart';
import 'package:flutter_tech_task/service/comments/comment.dart';
import 'package:flutter_tech_task/service/comments/comment_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_service.g.dart';

@riverpod
FutureOr<List<Comment>> commentService(
  Ref ref,
  int postId,
  bool tryCache,
) async {
  List<CommentModel> result = [];
  final CommentMapper mapper = CommentMapper();
  final DatabaseController db = await ref.watch(
    getDatabaseControllerProvider.future,
  );
  final ApiController api = await ref.watch(getApiControllerProvider.future);

  if (tryCache) {
    result = await db.getComments(postId);
  }
  if (result.isEmpty) {
    result = await api.getComments(postId: postId);
  }
  return mapper.fromRepositoryList(result);
}
