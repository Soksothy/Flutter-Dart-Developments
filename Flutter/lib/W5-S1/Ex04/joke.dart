// lib/W5-S1/Ex04/jokes.dart
class Joke {
  final String title;
  final String description;
  bool isFavorite;

  Joke({required this.title, required this.description, this.isFavorite = false});
}

List<Joke> jokes = [
  Joke(
    title: 'Girls Joke',
    description: 'Girl is the sweet poison.',
  ),
  Joke(
    title: 'Life Joke',
    description: 'It always seems impossible until it done.',
  ),
  Joke(
    title: 'Love Joke',
    description: 'People can`t spell love without hurt.',
  ),
];