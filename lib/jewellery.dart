import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'product_detail_page.dart';

class JewelleryPage extends StatelessWidget {
  const JewelleryPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "name": "Gold Necklace",
      "price": 2999,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUME2aB74Be590ju5aHQYcEoeg5oyfGE_BHg&s",
      "rating": 4.5,
      "offer": "10% OFF"
    },
    {
      "name": "Silver Earrings",
      "price": 1299,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3E9L0gMKsgXQKr4vD6ph_-FYd05HDoS67EQ&s",
      "rating": 4.0,
      "offer": "5% OFF"
    },
    {
      "name": "Diamond Ring",
      "price": 4999,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBHJ-LQITHvb2Hy84KMJFpYk9_nWFWM359zQ&s",
      "rating": 5.0,
      "offer": "15% OFF"
    },
    {
      "name": "chokar",
      "price": 6999,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH87wGawAnrZl6hW068vUJ46Cb15n1eZAUKA&s",
      "rating": 5.0,
      "offer": "15% OFF"
    },
    {
      "name": "Platinum Bracelet",
      "price": 8999,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXDYOH7UYtCSKTZFtWnzh6nbkAWWy8W-55Rg&s",
      "rating": 4.8,
      "offer": "12% OFF"
    },
    {
      "name": "Pearl Necklace",
      "price": 3499,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8C3gMUsKqze44EZ_4_8BUTAl6b4rCh1zYww&s",
      "rating": 4.6,
      "offer": "10% OFF"
    },
    {
      "name": "Gold Bangles Set",
      "price": 5599,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfQhUvzCAYfFUXmjATyzucHooW0aicQO1XLw&s",
      "rating": 4.7,
      "offer": "8% OFF"
    },
    {
      "name": "Emerald Pendant",
      "price": 4299,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsJu3H3txvGrZwbXS2j0-esxk1UuF57cmnEQ&s",
      "rating": 4.9,
      "offer": "15% OFF"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jewellery"),
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
          final cartItem = {
            "title": product["name"].toString(),
            "price": "₹${product["price"].toString()}",
            "image": product["image"].toString(),
          };

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(product: cartItem),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Product Image
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(
                            product["image"],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        // Offer Badge
                        if (product["offer"] != null)
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                product["offer"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Product Info
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
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
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

                        // Add to Cart & Wishlist Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                                onPressed: () {
                                  cart.addItemToCart(cartItem);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Added to Cart")),
                                  );
                                },
                                child: const Text("Add"),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                cart.isInWishlist(cartItem)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                if (cart.isInWishlist(cartItem)) {
                                  cart.removeFromWishlist(cartItem);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Removed from Wishlist")),
                                  );
                                } else {
                                  cart.addToWishlist(cartItem);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Added to Wishlist")),
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
