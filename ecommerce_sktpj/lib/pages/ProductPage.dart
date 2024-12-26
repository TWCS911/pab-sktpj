import 'package:ecommerce_sktpj/widgets/ProductAppBar.dart';
import 'package:ecommerce_sktpj/widgets/ProductIsi.dart';
import 'package:flutter/material.dart';

class Productpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Productappbar(),
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
                  Productisi(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}