import 'package:ecommerce_sktpj/widgets/cart_bottom_navbar.dart';
import 'package:ecommerce_sktpj/widgets/cart_item_samples.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_sktpj/widgets/cart_appbar.dart';

class Cartpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Membungkus dengan SingleChildScrollView untuk scrollable halaman
        child: Column(
          children: [
            Cartappbar(),
            // Kontainer untuk Cart Items dengan background color dan rounded corners
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
                  Cartitemsamples(), // Menampilkan daftar item keranjang

                  // Bagian untuk voucher code sebagai ElevatedButton
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4, // Add shadow to the button for a lifted effect
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.card_giftcard, // Voucher icon
                            color: Color(0xFF4C54A5),
                          ),
                          SizedBox(width: 10), // Space between the icon and text
                          Text(
                            "Masukkan Kode Voucher",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Cartbottomnavbar(), // Bottom navbar kustom
    );
  }
}
