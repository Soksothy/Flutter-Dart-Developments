import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  HobbyCard({
    required this.title,
    required this.icon,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 36, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hobby Cards')),
        body: Column(
          children: [
            HobbyCard(
              title: 'Photography',
              icon: Icons.camera_alt,
              color: Colors.blue,
            ),
            HobbyCard(
              title: 'Cooking',
              icon: Icons.restaurant,
              color: Colors.green,
            ),
            HobbyCard(
              title: 'Reading',
              icon: Icons.book,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}