// import 'package:ecommerce_sktpj/widgets/cart_bottom_navbar.dart';
// import 'package:ecommerce_sktpj/widgets/cart_item_samples.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce_sktpj/widgets/cart_appbar.dart';

// class Cartpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView( // Membungkus dengan SingleChildScrollView untuk scrollable halaman
//         child: Column(
//           children: [
//             Cartappbar(),
//             // Kontainer untuk Cart Items dengan background color dan rounded corners
//             Container(
//               height: 1000,
//               padding: EdgeInsets.only(top: 15),
//               decoration: BoxDecoration(
//                 color: Color(0xFFEDECF2),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(35),
//                   topRight: Radius.circular(35),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Cartitemsamples(), // Menampilkan daftar item keranjang

//                   // Bagian untuk voucher code sebagai ElevatedButton
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//                     padding: EdgeInsets.all(10),
//                     child: ElevatedButton(
//                       onPressed: () {
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         elevation: 4, // Add shadow to the button for a lifted effect
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.card_giftcard, // Voucher icon
//                             color: Color(0xFF4C54A5),
//                           ),
//                           SizedBox(width: 10), // Space between the icon and text
//                           Text(
//                             "Masukkan Kode Voucher",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Cartbottomnavbar(), // Bottom navbar kustom
//     );
//   }
// }

import 'package:ecommerce_sktpj/pages/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_sktpj/providers/cart_provider.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: cart.items.isEmpty
          ? Center(child: Text('Keranjang Anda kosong!'))
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  leading: Image.asset(item.product.imageAsset, width: 50),
                  title: Text(item.product.name),
                  subtitle: Text('Jumlah: ${item.quantity}'),
                  trailing: Text(
                    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0)
                        .format(item.product.harga * item.quantity),
                  ),
                  onLongPress: () {
                    cart.removeFromCart(item.product);
                  },
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Total: ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(cart.totalPrice.toInt())}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (cart.items.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage(totalAmount: cart.totalPrice.toDouble())),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Keranjang Anda kosong!')),
                      );
                    }
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

