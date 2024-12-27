import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = "All";
  List<String> categories = ["All", "Prescription", "OTC", "Supplements"];

  // Sample data for the search results (Pharmacy-related products)
  List<Map<String, String>> searchResults = [
    {"name": "Paracetamol", "category": "OTC", "price": "\$5", "availability": "In Stock"},
    {"name": "Ibuprofen", "category": "OTC", "price": "\$7", "availability": "In Stock"},
    {"name": "Amoxicillin", "category": "Prescription", "price": "\$15", "availability": "In Stock"},
    {"name": "Vitamin C", "category": "Supplements", "price": "\$10", "availability": "Out of Stock"},
    {"name": "Lisinopril", "category": "Prescription", "price": "\$20", "availability": "In Stock"},
    {"name": "Calcium Tablets", "category": "Supplements", "price": "\$8", "availability": "In Stock"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF4C54A5),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Search Medicine', style: TextStyle(color: Color(0xFF4C54A5))),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt, color: Color(0xFF4C54A5),),
            onPressed: () {
              _showCategoryFilter(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for medicine, vitamins, etc.',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
          
          // Category filter
          if (_selectedCategory != 'All') 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Category: $_selectedCategory',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          
          // Search results list
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                if (_searchQuery.isEmpty ||
                    searchResults[index]['name']!
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase())) {
                  // Filter by category
                  if (_selectedCategory == "All" ||
                      searchResults[index]['category'] == _selectedCategory) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        title: Text(searchResults[index]['name']!),
                        subtitle: Text(
                          'Category: ${searchResults[index]['category']} - ${searchResults[index]['availability']}',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        trailing: Text(
                          searchResults[index]['price']!,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          // Handle item tap (e.g., navigate to product detail page)
                          print('Tapped on: ${searchResults[index]['name']}');
                        },
                      ),
                    );
                  } else {
                    return Container(); // No results if category doesn't match
                  }
                } else {
                  return Container(); // No results if search query doesn't match
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCategoryFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(categories[index]),
              onTap: () {
                setState(() {
                  _selectedCategory = categories[index];
                });
                Navigator.pop(context); // Close the filter modal
              },
            );
          },
        );
      },
    );
  }
}