import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_sktpj/pages/CartPage.dart';
import 'package:ecommerce_sktpj/pages/main_page.dart';
import 'package:flutter/material.dart';

class Homeappbar extends StatelessWidget{
  const Homeappbar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.all(25),
        child: Row(children: [
        Text(
          "Apotek Maggha Mulia",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color:Color(0xFF4C54A5)
          ),
        ),
        Spacer(),
        badges.Badge(
          badgeStyle: badges.BadgeStyle(
            badgeColor: Colors.red,
            padding:(EdgeInsets.all(7)),
          ),
          badgeContent: Text(
            "3",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartpage()));
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
}