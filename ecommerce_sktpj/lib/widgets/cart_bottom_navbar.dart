import 'package:ecommerce_sktpj/pages/checkout_page.dart';
import 'package:flutter/material.dart';

class Cartbottomnavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 90, // Height for the bottom app bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the elements
          children: [
            // Cart Icon on the left
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
                color: Color(0xFF4C54A5),
              ),
              onPressed: () {
              },
            ),
            
            // Baris untuk menampung total harga dan tombol checkout berdampingan
            Row(
              children: [
                // Total Price Label
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        'Total:', // Perbarui ini secara dinamis berdasarkan item keranjang
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54, // Muted color for label
                      ),
                    ),
                    Text(
                      '\$199.99', // Dynamically updated value
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Bold for total price
                      ),
                    ),
                  ],
                ),
                
                SizedBox(width: 20), // Spacer antara total dan tombol checkout

                // Checkout Button
                ElevatedButton(
                  onPressed: () {
                    // Add checkout functionality here
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutPage()));
                  },
                  child: Text("Checkout"),
                  style: ElevatedButton.styleFrom(
                    iconColor: Color(0xFF4C54A5), // Button color matches the cart icon
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
