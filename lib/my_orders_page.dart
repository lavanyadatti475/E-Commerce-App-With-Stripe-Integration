import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'custom_app_bar.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "My Orders"),
      body: cart.orders.isEmpty
          ? const Center(
              child: Text(
                "No orders placed yet.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: cart.orders.length,
              itemBuilder: (context, index) {
                final order = cart.orders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    leading: Image.network(order["image"]!, width: 50, height: 50),
                    title: Text(order["title"]!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price: ${order["price"]}"),
                        Text("Date: ${order["date"]}"),
                        Text(
                          "Status: ${order["status"]}",
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
