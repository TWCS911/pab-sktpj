import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_sktpj/pages/cart_page.dart';
import 'package:flutter/material.dart';

class Homeappbar extends StatelessWidget implements PreferredSizeWidget {
  const Homeappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 90, // Properti ini tetap digunakan
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
            badges.Badge(
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.red,
                padding: EdgeInsets.all(7),
              ),
              badgeContent: Text(
                "3",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cartpage()));
                },
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 35,
                  color: Color(0xFF4C54A5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90); // Sesuaikan dengan toolbarHeight
}
