import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onTap;
  final String name;

  const HomeButton({super.key, required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 99, 185, 228),
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          onPressed: onTap,
          child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}