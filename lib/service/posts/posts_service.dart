import 'package:flutter_tech_task/repository/data_sources/api/api_client.dart';
import 'package:flutter_tech_task/repository/data_sources/api/api_controller.dart';
import 'package:flutter_tech_task/repository/data_sources/database/database.dart';
import 'package:flutter_tech_task/repository/data_sources/database/database_controller.dart';
import 'package:flutter_tech_task/repository/models/posts/post_model.dart';
import 'package:flutter_tech_task/service/posts/post.dart';
import 'package:flutter_tech_task/service/posts/posts_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_service.g.dart';

@riverpod
class PostsService extends _$PostsService {
  final PostsMapper mapper = PostsMapper();

  @override
  FutureOr<List<Post>> build() async {
    final DatabaseController db = DatabaseController(
      database: await ref.watch(getDatabaseProvider.future),
    );
    final ApiController api = ApiController(
      client: await ref.watch(apiClientProvider.future),
    );
    List<PostModel> cacheResults = [];
    List<PostModel> apiResults = [];

    cacheResults = await db.getPosts();
    apiResults = await api.getAllPosts();

    return mapper.fromRepositoryList(apiResults, cachedPosts: cacheResults);
  }

  /// Stores a post on the datbase.
  Future<void> togglePostOffline(Post post) async {
    final List<Post> oldState = await future;
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final DatabaseController db = await ref.read(
        getDatabaseControllerProvider.future,
      );

      if (post.offline ?? false) {
        await db.storePost(mapper.toRepository(post.copyWith(offline: true)));
      } else {
        await db.deletePost(mapper.toRepository(post));
      }

      return oldState
          .map(
            (e) => e == post ? e.copyWith(offline: !(e.offline ?? false)) : e,
          )
          .toList();
    });
  }
}
