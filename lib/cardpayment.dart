import 'package:flutter/material.dart';
import 'paymentresult.dart';

class CardPaymentPage extends StatelessWidget {
  final double amount;
  final VoidCallback? onPaymentSuccess; // <-- add this

  const CardPaymentPage({super.key, required this.amount, this.onPaymentSuccess});

  @override
  Widget build(BuildContext context) {
    final cardNumberController = TextEditingController();
    final expiryController = TextEditingController();
    final cvcController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Card Payment'), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Pay ₹${amount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            TextField(controller: cardNumberController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Card Number', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: TextField(controller: expiryController, keyboardType: TextInputType.datetime, decoration: const InputDecoration(labelText: 'MM/YY', border: OutlineInputBorder()))),
                const SizedBox(width: 16),
                Expanded(child: TextField(controller: cvcController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'CVC', border: OutlineInputBorder()))),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.symmetric(vertical: 14)),
                onPressed: () {
                  // Place the order
                  if (onPaymentSuccess != null) onPaymentSuccess!();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PaymentResultPage(success: true, method: 'Credit/Debit Card'),
                    ),
                  );
                },
                child: const Text('Confirm Payment', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
