import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/service/posts/post.dart';
import 'package:flutter_tech_task/service/posts/posts_service.dart';

/// Loading state-aware button that displays the current
/// number of comments on a post.
class SavePostButton extends ConsumerWidget {
  const SavePostButton({required this.post, required this.disabled, super.key});

  /// The post to load comment state for.
  final Post post;

  /// Disable the button if in an error state
  final bool disabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: TextButton.icon(
        key: UniqueKey(),
        onPressed: disabled ? null : () => ref.read(storePostProvider(post)),
        icon: Icon(
          post.offline ?? false ? Icons.start : Icons.star_border_outlined,
        ),
        label: Text('Save this post'),
      ),
    );
  }
}
