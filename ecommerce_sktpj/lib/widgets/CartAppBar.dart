import 'package:ecommerce_sktpj/widgets/HomeAppBar.dart';
import 'package:flutter/material.dart';


class Cartappbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding:  EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "homePage");
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFF4C54A5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Keranjang",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C54A5),
              ),
            ), 
            ),
            Spacer(),
            Icon(
              Icons.more_vert,
              size: 30,
              color: Color(0xFF4C54A5),
            )
        ],
      ),
    );
  }
}