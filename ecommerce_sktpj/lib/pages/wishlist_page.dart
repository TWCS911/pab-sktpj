import 'package:ecommerce_sktpj/widgets/wishlist_appbar.dart';
import 'package:ecommerce_sktpj/widgets/wishlist_items.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WishlistAppbar(),
      body: ListView(
        children: [
          Container(
            height: 1000,
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
                // Categorieswidget(onTap: _filterProduct),  // Passing filter function

                // Display products (filtered or all)
                WishlistItems(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}