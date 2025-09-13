import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/service/comments/comment.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// Loading state-aware button that displays the current
/// number of comments on a post.
class CommentButton extends StatelessWidget {
  const CommentButton({
    required this.future,
    required this.onPressed,
    super.key,
  });

  /// Callback when pressed.
  ///
  /// Disabled when [future] has not completed.
  final Function() onPressed;

  /// The loading state of the comments.
  final AsyncValue<List<Comment>> future;

  @override
  Widget build(BuildContext context) {
    // Get the number of comments (if known).
    int? count = future.value?.length;

    // Enable only when the we have valid data.
    bool enabled = future is AsyncData;

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: TextButton.icon(
        onPressed: enabled ? onPressed : null,
        label: Text('Comments ${count != null ? '($count)' : '     '}'),
        icon: switch (future) {
          AsyncData() => Icon(Icons.comment),
          AsyncLoading() => LoadingAnimationWidget.progressiveDots(
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          AsyncError() => Icon(Icons.comments_disabled),
        },
      ),
    );
  }
}
