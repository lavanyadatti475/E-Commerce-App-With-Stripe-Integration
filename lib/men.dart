import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'product_detail_page.dart';

class MenPage extends StatelessWidget {
  const MenPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "name": "Casual Shirt",
      "price": 699,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBY_OS6GqewSYFmtyxI-UvZJEOopUj4apMQA&s",
      "rating": 4.0,
      "offer": "10% OFF"
    },
    {
      "name": "Jeans",
      "price": 899,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfgCp7ZlKY-lKelWys-v-90eT_rndHGRF0rg&s",
      "rating": 4.5,
      "offer": "15% OFF"
    },
    {
      "name": "T-Shirt",
      "price": 499,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3NQrbQZeHKowZmRWPudl0Che2voW7QhL2kA&s",
      "rating": 5.0,
      "offer": "5% OFF"
    },
    {
      "name": "Shirt",
      "price": 699,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeFSPpMJbLvQD_ntMDNsb1U8c2hIJ5iU78GQ&s",
      "rating": 5.0,
      "offer": "10% OFF"
    },
    {
  "name": "Formal Shirt",
  "price": 799,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5mG_isik4MjwRRaCn5v1Skjng6UDmnjSUPA&s",
  "rating": 4.3,
  "offer": "12% OFF"
},
{
  "name": "Chinos",
  "price": 999,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm9xkm5LbgE4DK3CaMu2tkm7tksXi5SAlf2w&s",
  "rating": 4.5,
  "offer": "15% OFF"
},
{
  "name": "Hoodie",
  "price": 1299,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIYzUgrGXb-6bmAoS8EAFxo0sks3ThnECblA&s",
  "rating": 4.2,
  "offer": "10% OFF"
},
{
  "name": "Casual Shorts",
  "price": 599,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnLtxoQGS0mjsJLUAbH-T6xJnLhxC2cwLyHw&s",
  "rating": 4.0,
  "offer": "8% OFF"
}
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Men"),
        backgroundColor: Colors.orange,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          final item = {
            "title": product["name"].toString(),
            "price": "₹${product["price"].toString()}",
            "image": product["image"].toString(),
          };

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(product: item),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Product Image & Offer Badge
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(
                            product["image"],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        if (product["offer"] != null)
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                product["offer"],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Product Info, Rating, Add to Cart & Wishlist
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          product["name"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₹${product["price"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.green),
                        ),
                        const SizedBox(height: 4),

                        // Rating Stars
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (i) {
                            final rating = (product["rating"] as double).round();
                            return Icon(
                              i < rating ? Icons.star : Icons.star_border,
                              size: 16,
                              color: Colors.orange,
                            );
                          }),
                        ),
                        const SizedBox(height: 4),

                        // Add to Cart & Wishlist
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                ),
                                onPressed: () {
                                  cart.addItemToCart(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("${product["name"]} added to cart"),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                                child: const Text("Add"),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                cart.isInWishlist(item)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                if (cart.isInWishlist(item)) {
                                  cart.removeFromWishlist(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "${product["name"]} removed from wishlist"),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                } else {
                                  cart.addToWishlist(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "${product["name"]} added to wishlist"),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
