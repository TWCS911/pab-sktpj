import 'package:ecommerce_sktpj/models/payment.dart';
import 'package:ecommerce_sktpj/data/payment_data.dart';
import 'package:ecommerce_sktpj/pages/payment_page.dart';
import 'package:ecommerce_sktpj/widgets/checkout_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  final double totalAmount;

  CheckoutPage({Key? key, required this.totalAmount}) : super(key: key);

  @override
  _CheckoutPaymentPageState createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPage> {
  Payment? _selectedPayment;

  void _selectPayment(Payment payment) {
    setState(() {
      _selectedPayment = payment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CheckoutAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: paymentList.length,
              itemBuilder: (context, index) {
                final payment = paymentList[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: Image.asset(
                      payment.iconAsset,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(payment.name),
                    subtitle: Text(payment.description),
                    trailing: Radio<Payment>(
                      value: payment,
                      groupValue: _selectedPayment,
                      onChanged: (Payment? value) {
                        if (value != null) {
                          _selectPayment(value);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Total: ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(widget.totalAmount)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedPayment != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(
                            totalAmount: widget.totalAmount,
                            selectedPayment: _selectedPayment!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select a payment method!'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Lanjut',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

