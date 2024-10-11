void main() {
  // Create some points
  var p1 = Point(0, 0);
  var p2 = Point(3, 4);

  // Print initial positions
  print('Initial p1: $p1');
  print('Initial p2: $p2');

  // Translate the points
  p1.translate(2, 3);
  p2.translate(-1, 5);

  // Print new positions
  print('After translation p1: $p1');
  print('After translation p2: $p2');
}

class Point {
  double x;
  double y;

  // Constructor
  Point(this.x, this.y);

  // Method to translate the point
  void translate(double dx, double dy) {
    x += dx;
    y += dy;
  }

  // Override toString for easy printing
  @override
  String toString() {
    return 'Point(x: $x, y: $y)';
  }
}