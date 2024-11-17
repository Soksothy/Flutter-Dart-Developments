// lib/W5-S1/Ex04/jokes.dart
class Joke {
  final String title;
  final String description;
  bool isFavorite;

  Joke({required this.title, required this.description, this.isFavorite = false});
}

List<Joke> jokes = List.generate(
  20,
  (index) => Joke(
    title: 'Joke Title $index',
    description: 'This is the description of joke $index.',
  ),
);