import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/presentation/home/screens/home_screen.dart';
import 'package:flutter_tech_task/presentation/posts/screens/post_details_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
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
      },
    );
  }
}
