import 'package:flutter/material.dart';

class MaterialsPage extends StatelessWidget {
  const MaterialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Materials"),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text("Materials will be shown here."),
      ),
    );
  }
}
