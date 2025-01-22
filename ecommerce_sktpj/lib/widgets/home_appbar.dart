import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_sktpj/pages/cart_page.dart';
import 'package:ecommerce_sktpj/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Pastikan provider diimpor

class Homeappbar extends StatelessWidget implements PreferredSizeWidget {
  const Homeappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Text(
              "Apotek Maggha Mulia",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C54A5),
              ),
            ),
            Spacer(),
            // Menggunakan Consumer untuk mendapatkan data jumlah item
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.red,
                    padding: EdgeInsets.all(7),
                  ),
                  badgeContent: Text(
                    cartProvider.cartItems.length.toString(), // Menampilkan jumlah item dalam cart
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 35,
                      color: Color(0xFF4C54A5),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
