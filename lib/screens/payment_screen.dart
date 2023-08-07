import 'package:flutter/material.dart';
import 'package:flutter_maps/stripe_payment/payment_manager.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => PaymentManager.makePayment(100, 'USD'),
          child: const Text('Pay Money 😍'),
        ),
      )
    );
  }
}
