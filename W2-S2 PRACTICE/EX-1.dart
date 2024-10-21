enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  // Named constructor for mobile developer
  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience)
      : _name = name,
        _baseSalary = 40000,
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  // Getter methods
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double salary = _baseSalary + (_yearsOfExperience * 2000);
    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $_name');
    print('Base Salary: \$${_baseSalary.toStringAsFixed(2)}');
    print('Skills: ${_skills.map((s) => s.toString().split('.').last).join(', ')}');
    print('Address: ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('Years of Experience: $_yearsOfExperience');
    print('Computed Salary: \$${computeSalary().toStringAsFixed(2)}');
  }
}

void main() {
  var address1 = Address('123 Main St', 'Anytown', '12345');
  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER, Skill.DART], address1, 5);
  emp1.printDetails();

  print('\n');

  var address2 = Address('456 Oak Rd', 'Somewhere', '67890');
  var emp2 = Employee.mobileDeveloper('Ronan', address2, 3);
  emp2.printDetails();
}