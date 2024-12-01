import 'package:flutter/material.dart';

class WeatherForecast extends StatelessWidget {
  final String condition;
  final int temperatureMin;
  final int temperatureMax;
  final String dayOfWeek;

  const WeatherForecast({super.key, 
    required this.condition,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.dayOfWeek,
  });

  Color _getConditionColor() {
    switch (condition) {
      case 'Sunny':
        return Colors.orange;
      case 'Rainy':
        return Colors.blueGrey;
      case 'Cloudy':
        return Colors.lightBlue;
      case 'Snowy':
        return Colors.green;
      default:
        return Colors.blueAccent;
    }
  }

  IconData _getConditionIcon() {
    switch (condition) {
      case 'Sunny':
        return Icons.wb_sunny;
      case 'Rainy':
        return Icons.grain;
      case 'Cloudy':
        return Icons.cloud;
      case 'Snowy':
        return Icons.ac_unit;
      default:
        return Icons.wb_sunny;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color:
          _getConditionColor(), // Changed to solid color for better visibility
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayOfWeek,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .white), // Change text color to white for contrast
                ),
                Icon(_getConditionIcon(),
                    color: Colors.white,
                    size: 40), // Changed icon color to white
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$temperatureMin°C - $temperatureMax°C',
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors
                          .white), // Change text color to white for contrast
                ),
                Text(
                  condition,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors
                          .white), // Change text color to white for contrast
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0),
          bodyMedium: TextStyle(fontSize: 14.0),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Weather Forecast')),
        body: ListView(
          children: [
            WeatherForecast(
              condition: 'Sunny',
              temperatureMin: 20,
              temperatureMax: 30,
              dayOfWeek: 'Mon',
            ),
            WeatherForecast(
              condition: 'Rainy',
              temperatureMin: 15,
              temperatureMax: 22,
              dayOfWeek: 'Tue',
            ),
            WeatherForecast(
              condition: 'Cloudy',
              temperatureMin: 18,
              temperatureMax: 24,
              dayOfWeek: 'Wed',
            ),
            WeatherForecast(
              condition: 'Snowy',
              temperatureMin: -5,
              temperatureMax: 5,
              dayOfWeek: 'Thu',
            ),
            WeatherForecast(
              condition: 'Sunny',
              temperatureMin: 22,
              temperatureMax: 28,
              dayOfWeek: 'Fri',
            ),
            WeatherForecast(
              condition: 'Rainy',
              temperatureMin: 16,
              temperatureMax: 20,
              dayOfWeek: 'Sat',
            ),
            WeatherForecast(
              condition: 'Cloudy',
              temperatureMin: 19,
              temperatureMax: 25,
              dayOfWeek: 'Sun',
            ),
          ],
        ),
      ),
    );
  }
}
