import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
          backgroundColor: Colors.teal,
        ),
        body: const Center(
          child: Text(
            'Hello, Flutter!',
            style: TextStyle(
              fontSize: 24,            // Set font size
              fontWeight: FontWeight.bold,  // Set font weight
              color: Colors.blueGrey,       // Set text color
            ),
          ),
        ),
      ),
    );
  }
}
