import 'package:ecommerce_sktpj/data/Product_data.dart';
import 'package:ecommerce_sktpj/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_sktpj/widgets/home_appbar.dart';
import 'package:ecommerce_sktpj/widgets/categories_widget.dart';
import 'package:ecommerce_sktpj/widgets/items_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Product> listProduct = productList;
  
  List<Product> filteredProduct = [];

  @override
  void initState() {
    super.initState();
    filteredProduct = listProduct;
  }

  void _filterProduct(String type) {
    setState(() {
      if (type == 'All' || type.isEmpty) {
        filteredProduct = listProduct;
      } else {
        filteredProduct = listProduct
            .where((product) => product.type == type)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Homeappbar(),
      body: ListView(
        children: [
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
                Categorieswidget(onTap: _filterProduct),
                Itemswidget(filteredProduct: filteredProduct),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
