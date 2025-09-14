import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/presentation/posts/widgets/comment_button.dart';
import 'package:flutter_tech_task/service/posts/post.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the tapped post from the previous route.
    final Post post = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
      appBar: AppBar(title: const Text('Post details')),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: Text(
                post.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Divider(height: 1),
            SizedBox(height: 10),
            Text(post.body, style: const TextStyle(fontSize: 16)),
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: CommentButton(
                postId: post.id,
                onPressed: (comments) => Navigator.of(
                  context,
                ).pushNamed('comments/', arguments: comments),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
