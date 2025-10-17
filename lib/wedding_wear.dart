import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart'; // Path to your CartModel

class WeddingWearPage extends StatelessWidget {
  const WeddingWearPage({super.key});

  final List<Map<String, String>> weddingProducts = const [
    {
      'title': 'Designer Lehenga',
      'price': '\$299.99',
      'image': 'https://images.unsplash.com/photo-1620081442049-d2bd8b1dfe3c?auto=format&fit=crop&w=500&q=80',
    },
    {
      'title': 'Sherwani Set',
      'price': '\$349.99',
      'image': 'https://images.unsplash.com/photo-1580292800689-5f43b29e3e9b?auto=format&fit=crop&w=500&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wedding Wear"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: weddingProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = weddingProducts[index];
            return Card(
              child: Column(
                children: [
                  Image.network(product['image']!, height: 120, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(product['price']!),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false).addItem(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product['title']} added to cart')),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
