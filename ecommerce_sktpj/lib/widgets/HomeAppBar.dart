import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class Homeappbar extends StatelessWidget{
  const Homeappbar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color : Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(children: [
        Icon(
          Icons.sort,
          size: 30,
          color: Color(0xFF4C53A5)
        ),
        Padding(padding: EdgeInsets.only(
          left: 20,
        ),
        child: Text(
          "Apotek Maggha Mulia",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color:Color(0xFF4C54A5)
          ),
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
              Navigator.pushNamed(context, "cartPage");
            },
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 35,
              color: Color(0xFF4C54A5),
            ),
          ),
        ),
      ],),
    );
  }
}