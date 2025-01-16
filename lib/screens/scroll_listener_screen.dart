// Scroll Listener Screen
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollListenerScreen extends StatefulWidget {
  @override
  _ScrollListenerScreenState createState() => _ScrollListenerScreenState();
}

class _ScrollListenerScreenState extends State<ScrollListenerScreen> {
  final ScrollController scrollController = ScrollController();
  bool isAppBarVisible = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        isAppBarVisible = scrollController.position.userScrollDirection !=
            ScrollDirection.reverse;
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          isAppBarVisible ? AppBar(title: const Text('Scroll Listener')) : null,
      body: ListView.builder(
        controller: scrollController,
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
    );
  }
}
