import 'package:flutter/material.dart';

class KurtisPage extends StatelessWidget {
  const KurtisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kurtis")),
      body: const Center(
        child: Text(
          "Browse all kinds of Kurtis",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
