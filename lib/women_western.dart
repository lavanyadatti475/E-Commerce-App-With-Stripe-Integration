import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'product_detail_page.dart';

class WomenWesternPage extends StatelessWidget {
  const WomenWesternPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "name": "Casual Dress",
      "price": 899,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAngXX8jHPSY8bm4AvMGMUBiaCp8uvULOphg&s",
      "rating": 4.0,
      "offer": "10% OFF"
    },
    {
      "name": "Jeans & Top",
      "price": 1299,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd5pkkv3EreeSjc7RH1qAvni3o-oRU3gji0Q&s",
      "rating": 4.5,
      "offer": "5% OFF"
    },
    {
      "name": "Jumpsuit",
      "price": 1499,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCpiKSucAUFAMUUisW3RlNk8LgMWVljksuvw&s",
      "rating": 5.0,
      "offer": "15% OFF"
    },
    {
      "name": "dress",
      "price": 1699,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN-nze3T0OT9g2xB8CORnO9X63YAjnchT7Vw&s",
      "rating": 4.5,
      "offer": "10% OFF"
    },
    {
  "name": "Maxi Dress",
  "price": 1799,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ57GTyySOpEMrD__HLg5rdwGs3nZQBLiAivQ&s",
  "rating": 4.6,
  "offer": "12% OFF"
},
{
  "name": "Skirt & Blouse Set",
  "price": 1399,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcobRBiztaxJMullKhguO47oUmgGuK1LPbkw&s",
  "rating": 4.4,
  "offer": "10% OFF"
},
{
  "name": "Formal Top",
  "price": 999,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwuTxzZi57Q1vquuj1ugZpi4Nid2XExDkoIg&s",
  "rating": 4.3,
  "offer": "8% OFF"
},
{
  "name": "Evening Gown",
  "price": 2499,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRAOIq33qpRk1uvSCXwGCAN6GfrOJ0OboZgQ&s",
  "rating": 5.0,
  "offer": "20% OFF"
}
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Women Western"),
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
