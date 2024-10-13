enum Direction { north, east, south, west }

void main() {
  // Initial position {4, 1} and facing north
  int x = 4;
  int y = 1;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "AARRA";

  // Print start position and instructions
  print("Start position: {$x, $y}");
  print("Default direction: ${direction.toString().split('.').last}");
  print("Instructions: $instructions");
  print(""); // Empty line for better readability

  // Process the instructions and get the final position and direction
  for (var instruction in instructions.split('')) {
    switch (instruction) {
      case 'R':
        direction = turnRight(direction);
        break;
      case 'L':
        direction = turnLeft(direction);
        break;
      case 'A':
        final newPosition = advance(x, y, direction);
        x = newPosition[0];
        y = newPosition[1];
        break;
    }
  }

  // Print the final position and direction
  print("Final position: {$x, $y}");
  print("Facing: ${direction.toString().split('.').last}");
}

Direction turnRight(Direction currentDirection) {
  return Direction.values[(currentDirection.index + 1) % 4];
}

Direction turnLeft(Direction currentDirection) {
  return Direction.values[(currentDirection.index - 1 + 4) % 4];
}

List<int> advance(int x, int y, Direction direction) {
  switch (direction) {
    case Direction.north:
      return [x, y + 1];
    case Direction.east:
      return [x + 1, y];
    case Direction.south:
      return [x, y - 1];
    case Direction.west:
      return [x - 1, y];
  }
}