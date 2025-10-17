import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _results = [];

  void _performSearch(String query) {
    // Simulate search results (you can replace with your real search logic)
    final sampleData = [
      'Apple AirPods Pro',
      'Bose Headphones',
      'Samsung Galaxy S21',
      'Sony WH-1000XM4',
      'Beats Studio3',
    ];

    setState(() {
      if (query.isEmpty) {
        _results = [];
      } else {
        _results = sampleData
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _performSearch,
              autofocus: true,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _results.isEmpty
                  ? const Center(child: Text('No results found'))
                  : ListView.builder(
                      itemCount: _results.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.shopping_bag_outlined),
                          title: Text(_results[index]),
                          onTap: () {
                            // Handle tapping a search result if needed
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Selected: ${_results[index]}')),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
