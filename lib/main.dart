import 'package:flutter/material.dart';
import 'package:listener_concepts_app/screens/animation_listener_screen.dart';
import 'package:listener_concepts_app/screens/scroll_listener_screen.dart';
import 'package:listener_concepts_app/screens/search_listener_screen.dart';
import 'package:listener_concepts_app/screens/theme_listener_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

// Home Screen with Tabs
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Listener Playground'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Search Listener'),
              Tab(text: 'Scroll Listener'),
              Tab(text: 'Animation Listener'),
              Tab(text: 'Theme Listener'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SearchListenerScreen(),
            ScrollListenerScreen(),
            AnimationListenerScreen(),
            ThemeListenerScreen(),
          ],
        ),
      ),
    );
  }
}
