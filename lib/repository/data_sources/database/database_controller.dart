import 'package:flutter_tech_task/repository/models/comments/comment_model.dart';
import 'package:flutter_tech_task/repository/models/posts/post_model.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/utils/value_utils.dart';

// part 'database_controller.g.dart';

class DatabaseController {
  DatabaseController({required this.database})
    : postStore = intMapStoreFactory.store('posts'),
      commentStore = intMapStoreFactory.store('comments');
  final Database database;

  late final StoreRef<int, Map<String, Object?>> postStore;
  late final StoreRef<int, Map<String, Object?>> commentStore;

  Future<void> storePost(PostModel post) async {
    await postStore.record(post.id).put(database, post.toJson());
  }

  Future<void> storeComments(List<CommentModel> comments) async {
    await Future.forEach(
      comments,
      (c) => commentStore.record(c.id).put(database, c.toJson()),
    );
  }

  Future<List<CommentModel>> getComments(int postId) async {
    final records = await commentStore.find(
      database,
      finder: Finder(filter: Filter.equals('postId', postId)),
    );

    return records.map((e) => CommentModel.fromJson(e.value)).toList();
  }

  Future<List<PostModel>> getPosts() async {
    final records = await postStore.find(database);

    return records.map((e) => PostModel.fromJson(cloneMap(e.value))).toList();
  }
}
