import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_sktpj/models/payment.dart';
import 'package:ecommerce_sktpj/providers/cart_provider.dart';
import 'package:ecommerce_sktpj/pages/main_page.dart';
import 'package:intl/intl.dart';

class PaymentConfirmationPage extends StatelessWidget {
  final Payment selectedPayment;
  final double totalAmount;

  const PaymentConfirmationPage({
    Key? key,
    required this.selectedPayment,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format total amount
    final formattedAmount =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0)
            .format(totalAmount);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Konfirmasi Pembayaran",
          style: TextStyle(color: Color(0xFF4C54A5), fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF4C54A5)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              "Pembayaran Berhasil!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              "Pembayaran Anda sebesar $formattedAmount menggunakan ${selectedPayment.name} telah berhasil diproses.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Isi keranjang setelah checkout jadi kosong
                Provider.of<CartProvider>(context, listen: false).clearCart();

                // Kembali ke halaman utama
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C54A5),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Kembali ke Beranda",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
