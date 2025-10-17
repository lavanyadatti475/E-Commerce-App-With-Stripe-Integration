import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart'; // Update the path according to your project structure

class LehangasPage extends StatelessWidget {
  const LehangasPage({super.key});

  final List<Map<String, String>> products = const [
    {
      'title': 'Red Bridal Lehanga',
      'price': '\$499.99',
      'image': 'https://images.unsplash.com/photo-1556905055-8f358a7a47b4?auto=format&fit=crop&w=500&q=80',
    },
    {
      'title': 'Golden Embroidered Lehanga',
      'price': '\$399.99',
      'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=500&q=80',
    },
    {
      'title': 'Blue Silk Lehanga',
      'price': '\$299.99',
      'image': 'https://images.unsplash.com/photo-1590080877777-8c93fa5e429d?auto=format&fit=crop&w=500&q=80',
    },
    {
      'title': 'Pink Floral Lehanga',
      'price': '\$349.99',
      'image': 'https://images.unsplash.com/photo-1604014231784-5b059145c8ed?auto=format&fit=crop&w=500&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lehangas"),
        backgroundColor: Colors.orange,
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
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                        onPressed: () {
                          cart.addItem(product);
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
