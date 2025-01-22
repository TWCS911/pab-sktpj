import 'package:ecommerce_sktpj/models/Product.dart';
import 'package:ecommerce_sktpj/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductBottomNavBar extends StatelessWidget {
  final Product product;
  final int quantity; // Add quantity field here

  ProductBottomNavBar({required this.product, required this.quantity}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  final cart = Provider.of<CartProvider>(context, listen: false);
                  cart.addToCart(product, quantity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.name} ditambahkan ke keranjang!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                ),
                child: Text(
                  'Add to Cart ($quantity)', // Show quantity here
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

