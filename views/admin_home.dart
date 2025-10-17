import 'package:flutter/material.dart';
import 'package:my_app/containers/dashboard_text.dart';
import 'package:my_app/containers/homebutton.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Stats
            DashboardText(keyword: "Total Products", value: "100"),
            DashboardText(keyword: "Total Products", value: "100"),
            DashboardText(keyword: "Total Products", value: "100"),
            DashboardText(keyword: "Total Products", value: "100"),
            DashboardText(keyword: "Total Products", value: "100"),
            const SizedBox(height: 20),

            // Buttons Grid
            Column(
              children: [
                Row(
                  children: [
                    HomeButton(onTap: () {}, name: "Orders"),
                    HomeButton(onTap: () {}, name: "Products"),
                  ],
                ),
                Row(
                  children: [
                    HomeButton(onTap: () {}, name: "Promos"),
                    HomeButton(onTap: () {}, name: "Banners"),
                  ],
                ),
                Row(
                  children: [
                    HomeButton(onTap: () {}, name: "Categories"),
                    HomeButton(onTap: () {}, name: "Coupons"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}