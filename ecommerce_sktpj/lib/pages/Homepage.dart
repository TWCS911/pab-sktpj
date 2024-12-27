import 'package:ecommerce_sktpj/data/Product_data.dart';
import 'package:ecommerce_sktpj/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_sktpj/widgets/HomeAppBar.dart';
import 'package:ecommerce_sktpj/widgets/CategoriesWidget.dart';
import 'package:ecommerce_sktpj/widgets/ItemsWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of all products
  List<Product> listProduct = productList;
  
  // Filtered product list (initially contains all products)
  List<Product> filteredProduct = [];

  @override
  void initState() {
    super.initState();
    // Initially, show all products
    filteredProduct = listProduct;
  }

  // Function to filter products based on the selected category
  void _filterProduct(String type) {
    setState(() {
      if (type == 'All' || type.isEmpty) {
        // If "All" is selected or no category is selected, show all products
        filteredProduct = listProduct;
      } else {
        // Filter the list based on the selected category
        filteredProduct = listProduct
            .where((product) => product.type == type)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Homeappbar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                // Categories widget to filter products
                Categorieswidget(onTap: _filterProduct),  // Passing filter function

                // Display products (filtered or all)
                Itemswidget(filteredProduct: filteredProduct),  // Pass filtered products
              ],
            ),
          ),
        ],
      ),
    );
  }
}
