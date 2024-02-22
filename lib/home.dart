import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int days = 30;
    const String name = "Devansh";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "My Application",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(),
      body: const Center(
        child: Text("Welcome to $days days of flutter $name "),
      ),
    );
  }
}
