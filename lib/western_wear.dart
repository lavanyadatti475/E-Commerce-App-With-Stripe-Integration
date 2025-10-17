import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart'; // ✅ Make sure this path is correct

class WesternWearPage extends StatelessWidget {
  const WesternWearPage({super.key});

  final List<Map<String, String>> products = const [
    {
      'title': 'Denim Jacket',
      'price': '\$49.99',
      'image': 'https://images.unsplash.com/photo-1618354691322-23c8b2c8a1d5?auto=format&fit=crop&w=500&q=80',
    },
    {
      'title': 'Floral Midi Dress',
      'price': '\$39.99',
      'image': 'https://images.unsplash.com/photo-1602810318383-8cfc596ded14?auto=format&fit=crop&w=500&q=80',
    },
    {
      'title': 'Crop Top & Jeans',
      'price': '\$59.99',
      'image': 'https://images.unsplash.com/photo-1620217590428-e8dcf429e2df?auto=format&fit=crop&w=500&q=80',
    },
    {
      'title': 'Leather Jacket',
      'price': '\$89.99',
      'image': 'https://images.unsplash.com/photo-1602810319004-4b07af68c6c9?auto=format&fit=crop&w=500&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context); // ✅ Access cart

    return Scaffold(
      appBar: AppBar(
        title: const Text("Western Wear"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      product['image']!,
                      height: 130,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      product['price']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                        onPressed: () {
                          cart.addItem(product); // ✅ Add to cart model
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product['title']} added to cart')),
                          );
                        },
                        child: const Text('Add to Cart'),
                      ),
                    ),
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