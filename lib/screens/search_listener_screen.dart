// Search Listener Screen
import 'package:flutter/material.dart';

class SearchListenerScreen extends StatefulWidget {
  @override
  _SearchListenerScreenState createState() => _SearchListenerScreenState();
}

class _SearchListenerScreenState extends State<SearchListenerScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<String> items = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Pineapple'
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    searchController.addListener(() {
      setState(() {
        filteredItems = items
            .where((item) => item
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(filteredItems[index])),
            ),
          ),
        ],
      ),
    );
  }
}
