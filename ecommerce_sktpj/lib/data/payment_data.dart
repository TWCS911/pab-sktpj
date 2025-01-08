import 'package:ecommerce_sktpj/models/payment.dart';

var paymentList = [
  Payment(
      name : 'Bank Transfer',
      description: 'Pay via ATM, Internet Banking, or Mobile Banking.',
      iconAsset: 'images/bank.png',
  ),
  Payment(
      name : 'E-Wallet',
      description: 'Pay with OVO, GoPay, Dana, or others.',
      iconAsset: 'images/ewallet.png',
  ),
  Payment(
      name : 'Credit Card',
      description: 'Pay with your Visa or Mastercard.',
      iconAsset: 'images/credit_card.png',
  ),
  Payment(
      name : 'Cash on Delivery',
      description: 'Pay in cash upon delivery.',
      iconAsset: 'images/cod.png',
  )
];