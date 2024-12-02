import 'package:flutter/material.dart';

class ScoreCard {
  final String title;
  int score;

  ScoreCard({required this.title, required this.score});
}

class ScoreCardWidget extends StatefulWidget {
  final ScoreCard data;

  const ScoreCardWidget({super.key, required this.data});

  @override
  _ScoreCardWidgetState createState() => _ScoreCardWidgetState();
}

class _ScoreCardWidgetState extends State<ScoreCardWidget> {
  void _increaseScore() {
    setState(() {
      if (widget.data.score < 10) {
        widget.data.score++;
      }
    });
  }

  void _decreaseScore() {
    setState(() {
      if (widget.data.score > 0) {
        widget.data.score--;
      }
    });
  }

  Color _getColor(int score) {
    int greenValue = (255 * (score / 10)).toInt();
    return Color.fromARGB(255, 0, greenValue, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.data.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16.0),
            Stack(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 40,
                  width: MediaQuery.of(context).size.width * (widget.data.score / 10),
                  decoration: BoxDecoration(
                    color: _getColor(widget.data.score),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _decreaseScore,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.red,
                  ),
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: _increaseScore,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.green,
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScoreBoard(),
    );
  }
}

class ScoreBoard extends StatelessWidget {
  final List<ScoreCard> scores = [
    ScoreCard(title: 'My score in Flutter', score: 7),
    ScoreCard(title: 'My score in Dart', score: 9),
    ScoreCard(title: 'My score in React', score: 5),
  ];

   ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Board'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: scores.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ScoreCardWidget(data: scores[index]),
            );
          },
        ),
      ),
    );
  }
}