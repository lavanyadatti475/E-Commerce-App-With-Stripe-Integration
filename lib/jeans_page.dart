import 'package:flutter/material.dart';

class JeansPage extends StatelessWidget {
  const JeansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jeans"),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text("Jeans Products will be shown here."),
      ),
    );
  }
}
