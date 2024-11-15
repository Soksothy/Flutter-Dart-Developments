import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;

  const CustomCard({super.key, required this.text, this.color, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(text: 'OOP', color: Colors.blue[300]),
            const SizedBox(height: 30),
            CustomCard(text: 'DART', color: Colors.blue),
            const SizedBox(height: 30),
            CustomCard(
              text: 'FLUTTER',
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
