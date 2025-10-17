import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'shop.dart';
import 'my_orders_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.orange,
      actions: [
        // Categories button
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ShopPage()),
            );
          },
          icon: const Icon(Icons.category, color: Colors.white),
          label: const Text(
            "Categories",
            style: TextStyle(color: Colors.white),
          ),
        ),

        // Cart icon
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Cart',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            );
          },
        ),

        // My Orders icon
        IconButton(
          icon: const Icon(Icons.list_alt),
          tooltip: 'My Orders',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MyOrdersPage()),
            );
          },
        ),
      ],
    );
  }
}
