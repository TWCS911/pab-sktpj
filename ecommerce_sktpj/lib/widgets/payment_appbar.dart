import 'package:flutter/material.dart';
import 'package:ecommerce_sktpj/models/payment.dart';

class PaymentAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Payment selectedPayment;

  const PaymentAppbar({super.key, required this.selectedPayment});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      toolbarHeight: 90,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          size: 30,
          color: Color(0xFF4C54A5),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Text(
              "Payment - ${selectedPayment.name}",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C54A5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90); // Sesuaikan dengan toolbarHeight
}
