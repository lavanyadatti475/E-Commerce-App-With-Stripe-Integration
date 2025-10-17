import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'cart_model.dart'; // <-- Import your cart model

void main() {
  runApp(const QuickCartApp());
}

class QuickCartApp extends StatelessWidget {
  const QuickCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartModel(), // Initialize CartModel
      child: MaterialApp(
        title: 'QuickCart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const HomePage(),
      ),
    );
  }
}
