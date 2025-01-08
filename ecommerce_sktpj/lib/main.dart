import 'package:ecommerce_sktpj/pages/cart_page.dart';
import 'package:ecommerce_sktpj/pages/login_page.dart';
import 'package:ecommerce_sktpj/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_sktpj/providers/cart_provider.dart';
import 'package:ecommerce_sktpj/pages/main_page.dart'; // Your main page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget{
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home: isLoggedIn ? LoginPage() : RegisterPage(),
      // home: CartPage(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: MainPage(),
//     );
//   }
// }

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => CartProvider(),
//       child: MyApp(),
//     ),
//   );
// }
