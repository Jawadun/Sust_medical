import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> paymentMethods = [
      {
        'type': 'Bkash',
        'details': '017XXXXXXXX',
        'icon': Icons.account_balance_wallet,
      },
      {
        'type': 'Credit Card',
        'details': '**** **** **** 1234',
        'icon': Icons.credit_card,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          final method = paymentMethods[index];
          return Card(
            child: ListTile(
              leading: Icon(method['icon'] as IconData, color: Colors.teal),
              title: Text(method['type'] as String),
              subtitle: Text(method['details'] as String),
              trailing: const Icon(Icons.edit),
            ),
          );
        },
      ),
    );
  }
}
