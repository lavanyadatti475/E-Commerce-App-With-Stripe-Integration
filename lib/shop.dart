import 'package:flutter/material.dart';
import 'kurtis_sarees_lehenga.dart';
import 'women_western.dart';
import 'toys.dart';
import 'men.dart';
import 'home_kitchen.dart';
import 'jewellery.dart';
import 'bags_footwear.dart';
import 'books.dart';
import 'category_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with SingleTickerProviderStateMixin {
  final List<Map<String, String>> categories = [
    {
      "name": "Kurtis, Sarees & Lehenga",
      "image": "https://i.pinimg.com/736x/47/64/62/4764620c68d27c7d0937472393e928f2.jpg"
    },
    {
      "name": "Women Western",
      "image": "https://images.meesho.com/images/products/306320149/4i7bu_512.avif?width=512"
    },
    {
      "name": "Toys",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3s0ASKC_AZgMkSYW-MkVA9XDFbkY2aPOizQ&s"
    },
    {
      "name": "Men",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxF1hjW7xZGQCs2AK09jNgXuSu7OnmztqL0w&s"
    },
    {
      "name": "Home & Kitchen",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSYOmzGSbOKpvahjVxj-TptGXBYKbM6-NnPA&s"
    },
    {
      "name": "Jewellery",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVAn0IuFpvV4KbhmGIQIC35NysLOXoZ52vlYEVCwbtvjHoUAPokJbXePE&s"
    },
    {
      "name": "Bags & Footwear",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrCOIaFcymRVU-1xW-pLIkIXfJGajViP5ogw&s"
    },
    {
      "name": "Books",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-5Ei0F_j0MnzOfLg0x-GqTVcgss3x_yogXw&s"
    },
  ];

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getCategoryPage(String name) {
    switch (name) {
      case "Kurtis, Sarees & Lehenga":
        return const KurtisSareesLehengaPage();
      case "Women Western":
        return const WomenWesternPage();
      case "Toys":
        return const ToysPage();
      case "Men":
        return const MenPage();
      case "Home & Kitchen":
        return const HomeKitchenPage();
      case "Jewellery":
        return const JewelleryPage();
      case "Bags & Footwear":
        return const BagsFootwearPage();
      case "Books":
        return const BooksPage();
      default:
        return CategoryPage(categoryName: name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search products or categories...",
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            // Category grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return TweenAnimationBuilder(
                    duration: Duration(milliseconds: 800 + index * 50),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, double value, child) {
                      return Transform.scale(scale: value, child: child);
                    },
                    child: GestureDetector(
                      onTap: () {
                        String name = category["name"] ?? "";
                        Widget page = getCategoryPage(name);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => page),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(category["image"] ?? ""),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              category["name"] ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
