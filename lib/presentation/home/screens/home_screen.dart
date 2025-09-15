import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/presentation/home/widgets/post_list_item.dart';
import 'package:flutter_tech_task/service/posts/posts_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsServiceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('List of posts')),
      body: Center(
        child: Builder(
          builder: (context) {
            return switch (posts) {
              AsyncData(:final value) => ListView.builder(
                itemBuilder: (_, index) => PostListItem(post: value[index]),
              ),
              AsyncError(:final error) => ErrorWidget(error),
              AsyncLoading() => CircularProgressIndicator(),
            };
          },
        ),
      ),
    );
  }
}
