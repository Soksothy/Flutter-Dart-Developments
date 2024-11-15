import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationWidget(),
    );
  }
}

class NavigationWidget extends StatefulWidget {
  @override
  _NavigationWidgetState createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  bool _isHomeScreen = true;

  void _toggleScreen() {
    setState(() {
      _isHomeScreen = !_isHomeScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isHomeScreen ? 'Home Screen' : 'New Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _toggleScreen,
          child: Text(_isHomeScreen ? 'Go to New Screen' : 'Go Back'),
        ),
      ),
    );
  }
}