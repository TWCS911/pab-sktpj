import 'package:ecommerce_sktpj/models/Product.dart';
import 'package:ecommerce_sktpj/pages/main_page.dart';
import 'package:flutter/material.dart';


class Productappbar extends StatelessWidget{
  final Product varProduct;
  const Productappbar({super.key, required this.varProduct});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
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
              "Detail Produk",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C54A5),
              ),
            ), 
            ),
            Spacer(),
        ],
      ),
    );
  }
}