import 'package:flutter/material.dart';
import 'package:flutter_30days/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int days = 30;
    const String name = "Devansh";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Application",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text("Welcome to $days days of flutter $name "),
      ),
    );
  }
}
