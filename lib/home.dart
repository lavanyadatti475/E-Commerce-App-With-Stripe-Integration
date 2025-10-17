import 'package:flutter/material.dart';
import 'package:my_app/profilepage.dart';
import 'package:my_app/searchpage.dart';
import 'cart_page.dart';
import 'login_page.dart';
import 'newsletter_page.dart';
import 'product_detail_page.dart';
import 'shop.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'title': 'Apple AirPods Pro 2nd gen',
      'price': '\$199.99',
      'rating': 4.5,
      'image': 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRBbOqj5LCAHLkiwjZaEpF17KTE955FQfBtb8Giny5YbBugjRtRxWHeGksXzWxlq-pz5c2_m75dgTMpGYDe-5QWYzbdjTsjitmYT7yzdg7dbdxYffXRPpXyld3GR1bM_6PeeeLcuA&usqp=CAc'
    },
    {
      'title': 'Bose QuietComfort 45',
      'price': '\$329.99',
      'rating': 4.6,
      'image': 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSmmacm1Ilgtjq1xwIMzCGm0GIIc6wke-xQgGsUNzrVYzR3N8CiA1qD1jelVWzcwKRD-MjoFG0nxITgtfKNzR-8FcMAdmDWWN2I6DHy8sp_oCafsTT03qx-UI03xwRY&usqp=CAc'
    },
    {
      'title': 'Samsung Galaxy S21',
      'price': '\$799.99',
      'rating': 4.4,
      'image': 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQCNcEU0toKFF5R2k3M57PRgM__4S7CUiwvpy5b7ng_P0n4A1rX2E5C9-qbbqBuUhanRFgha0mIJSLqaerQ8nkSWwy_p5-1DVPm5XsKaeeyWahlI70wIgdEjP3Qk8H_CrsphClYWQ&usqp=CAc'
    },
    {
      'title': 'Sony WH-1000XM5',
      'price': '\$399.99',
      'rating': 4.7,
      'image': 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQKu6rm0lrC8wIVxOtGorttiRP2scM62H-Gx0CrkVXRUO9eZW_dtdeOSpTffBNKqjk97FTjMBbRKMPt75fGN4Rt52uWocNz06jjqg-vYnOo68cSOp_SJ1N6-ZggQOI7n4RvYb8mZKA&usqp=CAc'
    },
    {
      'title': 'Apple Watch Series 9',
      'price': '\$399.00',
      'rating': 4.8,
      'image': 'https://www.capesindia.com/cdn/shop/products/apple-watch-series-9-41mm-front_lava.jpg?v=1720877591&width=800'
    },
    {
      'title': 'Kindle Paperwhite',
      'price': '\$129.99',
      'rating': 4.5,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9bNmpn36RDBAFlVCaIYBvDFHlo_0dNZndvA&s'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickCart'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, _createRoute(const SearchPage()));
            },
            tooltip: 'Search Products',
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(context, _createRoute(const ProfilePage()));
            },
            tooltip: 'User Profile',
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            const SizedBox(height: 24),
            _buildSectionTitle('Featured Products'),
            const SizedBox(height: 12),
            _buildProductGrid(context),
            const SizedBox(height: 30),
            _buildNewsletterFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            child: Text(
              'QuickCart Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Categories'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, _createRoute(ShopPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, _createRoute(const CartPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, _createRoute(LoginPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, _createRoute(const ProfilePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, _createRoute(const SearchPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      color: const Color(0xFFEAEFFF),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Limited Time Offer 30% Off',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Experience Pure Sound\nYour Perfect Headphones Awaits!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          _createRoute(
                            ProductDetailPage(
                              product: {
                                'title': 'Sample',
                                'price': '\$0',
                                'image': '',
                                'rating': '0',
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Text('Buy now'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Find more →'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Image.network(
            'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRBbOqj5LCAHLkiwjZaEpF17KTE955FQfBtb8Giny5YbBugjRtRxWHeGksXzWxlq-pz5c2_m75dgTMpGYDe-5QWYzbdjTsjitmYT7yzdg7dbdxYffXRPpXyld3GR1bM_6PeeeLcuA&usqp=CAc',
            height: 140,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                _createRoute(ProductDetailPage(
                  product: {
                    'title': product['title'].toString(),
                    'price': product['price'].toString(),
                    'image': product['image'].toString(),
                    'rating': product['rating'].toString(),
                  },
                )),
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(product['image'], height: 100),
                    const SizedBox(height: 10),
                    Text(
                      product['title'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product['price'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (i) {
                        final rating = (product['rating'] as double).round();
                        return Icon(
                          i < rating ? Icons.star : Icons.star_border,
                          size: 16,
                          color: Colors.orange,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewsletterFooter(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Subscribe now & get 20% off',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 5),
          const Text(
            'Stay updated with the latest offers and products!',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 400,
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email id',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, _createRoute(const NewsletterPage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('Subscribe'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 10),
          const Text('© 2025 GreatStack.dev. All Rights Reserved.'),
        ],
      ),
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
