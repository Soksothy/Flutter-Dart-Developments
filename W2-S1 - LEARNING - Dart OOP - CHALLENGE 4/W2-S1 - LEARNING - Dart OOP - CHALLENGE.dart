class Distance {
  final double _m;
  final String _distanceUnit;

  const Distance._(this._m, this._distanceUnit);

  Distance.cm(double cm) : this._(cm / 100, 'cm');
  Distance.m(double m) : this._(m, 'm');
  Distance.km(double km) : this._(km * 1000, 'km');

  double get cm => _m * 100;
  double get m => _m;
  double get km => _m / 1000;

  Distance get inCm => Distance.cm(cm);
  Distance get inM => Distance.m(m);
  Distance get inKm => Distance.km(km);

  Distance operator +(Distance d2) {
    return Distance._(this._m + d2._m, 'm');
  }

  @override
  String toString() {
    switch (_distanceUnit) {
      case 'cm':
        return '|${cm.toStringAsFixed(2)} cm|';
      case 'm':
        return '|${m.toStringAsFixed(2)} m|';
      case 'km':
        return '|${km.toStringAsFixed(2)} km|';
      default:
        return '|${m.toStringAsFixed(2)} m|';
    }
  }
}

void main() {
  Distance d1 = Distance.m(10);
  // print(d1.inCm);
  Distance d2 = Distance.cm(200);
  // print(d2.inM);
  print('d1:$d1 + d2:$d2 = ${d1 + d2} In Cm: ${(d1 + d2).inCm} In Km: ${(d1 + d2).inKm}');

}