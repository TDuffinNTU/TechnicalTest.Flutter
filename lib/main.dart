import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/presentation/comments/screens/comment_screen.dart';
import 'package:flutter_tech_task/presentation/home/screens/home_screen.dart';
import 'package:flutter_tech_task/presentation/home/widgets/post_list_item.dart';
import 'package:flutter_tech_task/presentation/posts/screens/post_details_screen.dart';
import 'package:flutter_tech_task/service/posts/post.dart';
import 'package:flutter_tech_task/service/posts/posts_service.dart';

// A basic logger, which logs any state changes.
final class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    log('''
{
  "provider": "${context.provider}",
  "newValue": "${newValue.runtimeType}",
  "mutation": "${context.mutation}"
}''');
  }
}

void main() {
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: 'home/',
      routes: <String, WidgetBuilder>{
        'home/': (context) => const HomeScreen(),
        'details/': (context) => const DetailsPage(),
        'comments/': (context) => const CommentScreen(),
        'saved/': (context) => const SavedPostsScreen(),
      },
    );
  }
}

class SavedPostsScreen extends ConsumerWidget {
  const SavedPostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsServiceProvider);
    return Scaffold(
      appBar: AppBar(title: Text('saved')),
      body: posts.when(
        data: (data) {
          List<Post> filteredPosts = data
              .where((e) => e.offline ?? false)
              .toList();

          return ListView.builder(
            itemCount: filteredPosts.length,
            itemBuilder: (_, index) => PostListItem(post: filteredPosts[index]),
          );
        },
        error: (error, _) => ErrorWidget(error),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
