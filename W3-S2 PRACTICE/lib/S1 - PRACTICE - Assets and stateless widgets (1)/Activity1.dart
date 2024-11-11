import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 400,
                color: Colors.blueAccent,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      height: 100,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.pink,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 100, height: 100, color: Colors.orange),
                  const SizedBox(width: 20),
                  Container(width: 100, height: 100, color: Colors.orange),
                  const SizedBox(width: 20),
                  Container(width: 100, height: 100, color: Colors.orange),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                color: Colors.pink,
              ))
            ],
          ),
        ),
      ),
    ),
  );
}
