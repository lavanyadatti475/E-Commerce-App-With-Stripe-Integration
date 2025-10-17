import 'package:flutter/material.dart';

class HalfSareesPage extends StatelessWidget {
  const HalfSareesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Half Sarees"),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text("Half Sarees will be shown here."),
      ),
    );
  }
}
