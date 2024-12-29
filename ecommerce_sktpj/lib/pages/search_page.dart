import 'package:ecommerce_sktpj/models/Product.dart';
import 'package:ecommerce_sktpj/models/type_product.dart';
import 'package:flutter/material.dart';

// Mengimpor data
import 'package:ecommerce_sktpj/data/product_data.dart'; // File berisi productList
import 'package:ecommerce_sktpj/data/type_product_data.dart'; // File berisi listType

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    // Filter data berdasarkan kategori dan pencarian
    var filteredProducts = productList.where((product) {
      final matchesCategory = _selectedCategory == "All" || product.type == _selectedCategory;
      final matchesQuery = _searchQuery.isEmpty || product.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            controller: _searchController,
            onChanged: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search for medicine, vitamins, etc.',
              prefixIcon: Icon(Icons.search, color: Color(0xFF4C54A5)),
              fillColor: Colors.grey[200],
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt, color: Color(0xFF4C54A5)),
            onPressed: () {
              _showCategoryFilter(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
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
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                var product = filteredProducts[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: Image.asset(
                      product.imageAsset,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Text(
                      '${product.type} - ${product.harga}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    onTap: () {
                      // Handle item tap (e.g., navigate to product detail page)
                      print('Tapped on: ${product.name}');
                    },
                  ),
                );
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
          itemCount: listType.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listType[index].name),
              onTap: () {
                setState(() {
                  _selectedCategory = listType[index].name;
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
