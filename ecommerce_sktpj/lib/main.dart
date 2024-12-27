import 'package:ecommerce_sktpj/pages/LoginPage.dart';
import 'package:ecommerce_sktpj/pages/ProductPage.dart';
import 'package:ecommerce_sktpj/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_sktpj/pages/Homepage.dart';
import 'package:ecommerce_sktpj/pages/CartPage.dart';
import 'package:ecommerce_sktpj/pages/wishlist_page.dart';
import 'package:ecommerce_sktpj/pages/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: MainPage(),
      // routes: {
      //   //   "/" : (context) => Loginpage(),
      //     // "homePage" : (context) => Homepage(),
      //     // "wishlistPage" : (context) => WishlistPage(),
      //     // "profilePage" : (context) => ProfilePage(),
      // },
    );
  }
}