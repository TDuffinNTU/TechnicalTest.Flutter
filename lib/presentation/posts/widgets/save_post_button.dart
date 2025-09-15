import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/service/posts/post.dart';
import 'package:flutter_tech_task/service/posts/posts_service.dart';

/// Loading state-aware button that displays the current
/// number of comments on a post.
class SavePostButton extends ConsumerWidget {
  const SavePostButton({required this.post, super.key});

  /// The post to load comment state for.
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Post>> posts = ref.watch(postsServiceProvider);
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: posts.when(
        data: (data) {
          final newPost = data.firstWhere((e) => e == post);
          return TextButton.icon(
            key: UniqueKey(),
            onPressed: () => ref
                .read(postsServiceProvider.notifier)
                .togglePostOffline(newPost),

            icon: Icon(
              newPost.offline ?? false
                  ? Icons.bookmark
                  : Icons.bookmark_add_outlined,
            ),
            label: Text('Save this post'),
          );
        },
        error: (_, _) => Container(),
        loading: () => Container(),
      ),
    );
  }
}
