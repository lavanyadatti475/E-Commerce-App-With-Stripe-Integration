import 'package:flutter/material.dart';

class PaymentResultPage extends StatelessWidget {
  final bool success;
  final String method;

  const PaymentResultPage(
      {super.key, required this.success, required this.method});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Status')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              success ? Icons.check_circle : Icons.error,
              color: success ? Colors.green : Colors.red,
              size: 80,
            ),
            const SizedBox(height: 20),
            Text(
              success
                  ? 'Payment Successful via $method'
                  : 'Payment Failed. Try again.',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                // Or navigate user to order summary / home
              },
              child: const Text('Continue'),
            )
          ],
        ),
      ),
    );
  }
}
