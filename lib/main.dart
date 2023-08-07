import 'package:flutter/material.dart';
import 'package:flutter_maps/screens/main_screen.dart';
import 'package:flutter_maps/screens/payment_screen.dart';
import 'package:flutter_maps/stripe_payment/stripe_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/main_screen',
      routes: {
        '/main_screen': (context) => const MainScreen(),
        '/payment_screen': (context) => const PaymentScreen(),
      },
    );
  }
}

