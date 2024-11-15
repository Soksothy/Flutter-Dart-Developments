import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello my name is Sothy',
            style: TextStyle(
              fontSize: 30, // Set font size
              fontWeight: FontWeight.bold, // Set font weight
              color: Colors.orange, // Set text color
            ),
          ),
        ),
      ),
    );
  }
}
