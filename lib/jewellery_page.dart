import 'package:flutter/material.dart';

class JewelleryPage extends StatelessWidget {
  const JewelleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jewellery"),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text("Jewellery Products will be shown here."),
      ),
    );
  }
}
