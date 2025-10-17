import 'package:flutter/material.dart';
import 'upi.dart';
import 'stripe.dart';
import 'paymentresult.dart';
import 'cart_model.dart';
import 'package:provider/provider.dart';

class PaymentMethodPage extends StatelessWidget {
  final double amount;

  const PaymentMethodPage({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Payment Method'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_balance_wallet, color: Colors.green),
            title: const Text('UPI'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UpIPaymentPage(
                    amount: amount,
                    onPaymentSuccess: () {
                      cart.placeOrder(); // Add order to _orders
                    },
                  ),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment, color: Colors.blue),
            title: const Text('Stripe'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StripePaymentPage(
                    amount: amount,
                    onPaymentSuccess: () {
                      cart.placeOrder(); // Add order to _orders
                    },
                  ),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.money, color: Colors.orange),
            title: const Text('Cash on Delivery'),
            onTap: () {
              cart.placeOrder(); // Directly place order for COD
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const PaymentResultPage(
                    success: true,
                    method: 'Cash on Delivery',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
