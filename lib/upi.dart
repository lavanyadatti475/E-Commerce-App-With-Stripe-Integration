import 'package:flutter/material.dart';
import 'paymentresult.dart';

class UpIPaymentPage extends StatelessWidget {
  final double amount;
  final VoidCallback? onPaymentSuccess; // <-- add this

  const UpIPaymentPage({super.key, required this.amount, this.onPaymentSuccess});

  @override
  Widget build(BuildContext context) {
    final upiController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Pay with UPI')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Amount: ₹${amount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            TextField(
              controller: upiController,
              decoration: const InputDecoration(
                labelText: 'UPI ID (example@bank)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call cart.placeOrder() through the callback
                if (onPaymentSuccess != null) onPaymentSuccess!();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PaymentResultPage(
                      success: true,
                      method: 'UPI',
                    ),
                  ),
                );
              },
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
