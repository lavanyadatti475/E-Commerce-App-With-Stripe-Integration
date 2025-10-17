import 'package:flutter/material.dart';
import 'cardpayment.dart';

class StripePaymentPage extends StatelessWidget {
  final double amount;
  final VoidCallback? onPaymentSuccess; // <-- add this

  const StripePaymentPage({super.key, required this.amount, this.onPaymentSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stripe Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Amount: ₹${amount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.credit_card),
              label: const Text('Pay Using Card'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CardPaymentPage(
                      amount: amount,
                      onPaymentSuccess: onPaymentSuccess, // <-- pass callback
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
