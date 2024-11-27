import 'package:uuid/uuid.dart';

enum ExpenseType { FOOD, TRAVEL, LEISURE, WORK }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({
    String? id,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = id ?? Uuid().v4();
}