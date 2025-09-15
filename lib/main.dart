import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/presentation/comments/screens/comment_screen.dart';
import 'package:flutter_tech_task/presentation/home/screens/home_screen.dart';
import 'package:flutter_tech_task/presentation/posts/screens/post_details_screen.dart';

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
      },
    );
  }
}
