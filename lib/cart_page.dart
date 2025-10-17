import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'payment_method_page.dart';
import 'custom_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Your Cart'),

      // BODY
      body: cart.isCartEmpty
          ? const Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (_, index) {
                final item = cart.items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item['image'] ?? '',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item['title'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      item['price'] ?? '',
                      style: const TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                      onPressed: () {
                        cart.removeItemAtIndex(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Removed from Cart')),
                        );
                      },
                    ),
                  ),
                );
              },
            ),

      // BOTTOM BAR
      bottomNavigationBar: cart.isCartEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, offset: Offset(0, -1), blurRadius: 6)
                ],
              ),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to PaymentMethodPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentMethodPage(amount: cart.totalPrice),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Pay Now (₹${cart.totalPrice.toStringAsFixed(2)})',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
