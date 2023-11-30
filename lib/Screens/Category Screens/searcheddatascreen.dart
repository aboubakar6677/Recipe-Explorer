// search_results_screen.dart

import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  final String searchData;

  const SearchResultsScreen({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: Center(
        child: Text('Search results for: $searchData'),
      ),
    );
  }
}
