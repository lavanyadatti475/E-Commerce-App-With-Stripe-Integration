import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'product_detail_page.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "name": "Flutter Development",
      "price": 599,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuHgKXgZ5libKFqXV78uUq5mXW850YTo0FTw&s",
      "rating": 4.5,
      "offer": "10% OFF"
    },
    {
      "name": "Data Science",
      "price": 799,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtPgt2RycfTHhr0yG3MAOiyNALstwtH5MUbw&s",
      "rating": 4.0,
      "offer": "5% OFF"
    },
    {
      "name": "Machine Learning",
      "price": 999,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoNnWWdG-ac7HyqmQbTickI5rPWMRvTGykrg&s",
      "rating": 4.2,
      "offer": "15% OFF"
    },
    {
  "name": "Python Programming",
  "price": 699,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHGmdQ0lycJ44SsAScP-k6dDklbpyrhg1OeQ&s",
  "rating": 4.6,
  "offer": "10% OFF"
},
{
  "name": "Web Development",
  "price": 899,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU97U14T09VutCnRRawfTrP_lt9XK6vEtn1A&s",
  "rating": 4.7,
  "offer": "15% OFF"
},
{
  "name": "Java Programming",
  "price": 799,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeLvyEYTC6cFRHjTV-H5q1LszzTa0wUmbXIg&s",
  "rating": 4.5,
  "offer": "10% OFF"
},
{
  "name": "Android Development",
  "price": 899,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy7evqvrm2KjPgSVmuZf_exrT5dNEMCCprtQ&s",
  "rating": 4.4,
  "offer": "12% OFF"
},
{
  "name": "ReactJS Course",
  "price": 699,
  "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDtZCKSVZbTtJLTjSD5escEzqBXyz0f8WGpw&s",
  "rating": 4.3,
  "offer": "10% OFF"
}

  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Product Image & Offer Badge
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
                                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
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
                          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
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
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                                onPressed: () {
                                  cart.addItemToCart(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${product["name"]} added to cart"),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                                child: const Text("Add"),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                cart.isInWishlist(item) ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                if (cart.isInWishlist(item)) {
                                  cart.removeFromWishlist(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${product["name"]} removed from wishlist"),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                } else {
                                  cart.addToWishlist(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${product["name"]} added to wishlist"),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                }
                              },
                            )
                          ],
                        )
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
