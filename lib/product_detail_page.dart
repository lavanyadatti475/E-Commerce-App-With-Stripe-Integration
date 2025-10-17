import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product['title'] ?? "Product"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(
              cart.isInWishlist(product) ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              if (cart.isInWishlist(product)) {
                cart.removeFromWishlist(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Removed from Wishlist")),
                );
              } else {
                cart.addToWishlist(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to Wishlist")),
                );
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product['image'] ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                product['title'] ?? '',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                product['price'] ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      final rating = double.tryParse(product['rating'] ?? '4.5') ?? 4.5;
                      return Icon(
                        index < rating.round() ? Icons.star : Icons.star_border,
                        color: Colors.orange,
                        size: 20,
                      );
                    }),
                  ),
                  const SizedBox(width: 8),
                  Text("(${product['rating'] ?? '4.5'})"),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.local_offer, color: Colors.orange),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Get 10% off on first purchase. Limited time offer!",
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    cart.addItemToCart(product); // <-- Corrected method name
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to Cart")),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text("Add to Cart", style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Customer Reviews",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ReviewTile(
                      name: "Alice",
                      comment: "Very beautiful and elegant!",
                      rating: 5),
                  ReviewTile(
                      name: "Bob",
                      comment: "Good quality, fast delivery.",
                      rating: 4),
                  ReviewTile(
                      name: "Cathy",
                      comment: "Looks exactly as pictured.",
                      rating: 4),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final String name;
  final String comment;
  final int rating;

  const ReviewTile(
      {super.key, required this.name, required this.comment, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(child: Text(name[0]), radius: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      size: 16,
                      color: Colors.orange,
                    );
                  }),
                ),
                Text(comment),
              ],
            ),
          )
        ],
      ),
    );
  }
}
