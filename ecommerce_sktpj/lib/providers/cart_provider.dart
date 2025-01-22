import 'package:ecommerce_sktpj/models/Product.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product, int quantity) {
    bool itemExists = false;

    // Check if the product already exists in the cart
    for (var cartItem in _cartItems) {
      if (cartItem.product.name == product.name) { // Using unique ID for comparison
        cartItem.quantity += quantity; // Update quantity
        itemExists = true;
        break;
      }
    }

    // Add new product if it doesn't exist
    if (!itemExists) {
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }

    notifyListeners(); // Notify listeners of change
  }


  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear(); // Clears all items from the cart
    notifyListeners(); // Notify listeners to update the UI
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.product.harga * item.quantity; // Multiply price by quantity
    }
    return total;
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}
