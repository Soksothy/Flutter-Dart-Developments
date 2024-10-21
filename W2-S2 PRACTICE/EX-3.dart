class MyDuration {
  final int _milliseconds;

  MyDuration._internal(this._milliseconds);

  factory MyDuration.fromHours(int hours) {
    return MyDuration._internal(hours * 60 * 60 * 1000);
  }

  factory MyDuration.fromMinutes(int minutes) {
    return MyDuration._internal(minutes * 60 * 1000);
  }

  factory MyDuration.fromSeconds(int seconds) {
    return MyDuration._internal(seconds * 1000);
  }

  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration._internal(_milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    if (_milliseconds < other._milliseconds) {
      throw Exception('Resulting duration would be negative');
    }
    return MyDuration._internal(_milliseconds - other._milliseconds);
  }

  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3);
  MyDuration duration2 = MyDuration.fromMinutes(45);
  print(duration1 + duration2);
  print(duration1 > duration2);

  try {
    print(duration2 - duration1);
  } catch (e) {
    print(e); 
  }
}