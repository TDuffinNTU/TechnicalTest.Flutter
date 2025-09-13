import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/presentation/comments/widgets/comment_list_item.dart';
import 'package:flutter_tech_task/service/comments/comment.dart';

class CommentScreen extends ConsumerWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Comment> comments =
        ModalRoute.of(context)!.settings.arguments as List<Comment>;

    return Scaffold(
      appBar: AppBar(title: Text('Comments')),
      body: ListView(
        children: comments.map((e) => CommentListItem(comment: e)).toList(),
      ),
    );
  }
}
