import 'package:flutter/material.dart';
import 'package:ecommerce_sktpj/models/Product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(
        0.0,
        (sum, item) => sum + (item.product.harga * item.quantity),
      );

  void addToCart(Product product) {
    final index = _items.indexWhere((item) => item.product.name == product.name);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }

  void clearCart() {
    _items.clear(); // Menghapus semua item di keranjang
    notifyListeners();
  }
}
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}
