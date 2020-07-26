import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/payment-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
      ),
      body: Center(
        child: Text('Payment Screen'),
      ),
    );
  }
}
