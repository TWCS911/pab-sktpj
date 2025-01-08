import 'package:ecommerce_sktpj/models/payment.dart';
import 'package:ecommerce_sktpj/pages/payment_confirmation_page.dart';
import 'package:ecommerce_sktpj/widgets/payment_appbar.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final Payment selectedPayment;
  final double totalAmount;

  const PaymentPage({Key? key, required this.selectedPayment, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaymentAppbar(selectedPayment: selectedPayment),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  selectedPayment.iconAsset,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Text(
                  selectedPayment.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              selectedPayment.description,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.grey),

            if (selectedPayment.name == 'Bank Transfer') ...[
              Text(
                'Bank Transfer Instructions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
                Text('1. Transfer jumlah total ke rekening bank yang ditentukan.'),
                Text('2. Gunakan nomor pesanan sebagai referensi transfer.'),
                Text('3. Unggah bukti transfer di halaman konfirmasi.'),
            ],

            if (selectedPayment.name == 'E-Wallet') ...[
              Text(
                'E-Wallet Instructions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
                Text('1. Buka aplikasi e-wallet Anda (OVO, GoPay, dll.).'),
                Text('2. Pindai kode QR yang disediakan.'),
                Text('3. Konfirmasi pembayaran di aplikasi.'),
            ],

            if (selectedPayment.name == 'Credit Card') ...[
              Text(
                'Credit Card Payment:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
                Text('1. Masukkan detail kartu Anda di layar berikutnya.'),
                Text('2. Pastikan kartu memiliki saldo yang cukup.'),
                Text('3. Selesaikan pembayaran dengan aman.'),
            ],

            if (selectedPayment.name == 'Cash on Delivery') ...[
              Text(
                'Cash on Delivery (COD):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
                Text('1. Pastikan Anda memiliki jumlah yang tepat.'),
                Text('2. Serahkan uang tunai kepada kurir.'),
                Text('3. Ambil tanda terima Anda setelah pembayaran.'),
            ],

            Spacer(),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Proceeding with ${selectedPayment.name}...'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentConfirmationPage(
                        selectedPayment: selectedPayment,
                        totalAmount: totalAmount,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Lanjutkan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
