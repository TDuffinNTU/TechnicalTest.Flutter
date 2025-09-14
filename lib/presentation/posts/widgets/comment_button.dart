import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/service/comments/comment.dart';
import 'package:flutter_tech_task/service/comments/comment_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// Loading state-aware button that displays the current
/// number of comments on a post.
class CommentButton extends ConsumerWidget {
  const CommentButton({
    required this.postId,
    required this.onPressed,
    super.key,
  });

  /// Callback to collect the loaded comments for navigation.
  ///
  /// Disabled when in a loading or error state.
  final Function(List<Comment>) onPressed;

  // The post to load comment state for.
  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(commentServiceProvider(postId, false));
    return comments.when(
      data: (data) => TextButton.icon(
        key: UniqueKey(),
        onPressed: () => onPressed(data),
        icon: Icon(Icons.comment),
        label: Text('Comments (${data.length})'),
      ),
      error: (_, _) => TextButton.icon(
        key: UniqueKey(),
        onPressed: null,
        icon: Icon(Icons.comments_disabled),
        label: Text('Comments (0)'),
      ),
      loading: () => TextButton.icon(
        key: UniqueKey(),
        onPressed: () {},
        icon: Icon(Icons.comment),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Comments'),
            SizedBox(width: 8),
            LoadingAnimationWidget.progressiveDots(
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
