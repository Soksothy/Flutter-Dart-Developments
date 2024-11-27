import 'package:flutter/material.dart';
import 'package:expen_app/model/expense.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView({super.key});
  @override
  _ExpenseViewState createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Food',
      amount: 10.0,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Travel',
      amount: 20.0,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Leisure',
      amount: 30.0,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Work',
      amount: 40.0,
      date: DateTime.now(),
    ),
    Expense(
      title: 'thy',
      amount: 5.0,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                _registeredExpenses.add(
                  Expense(
                    title: 'New Expense',
                    amount: 0.0,
                    date: DateTime.now(),
                  ),
                );
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _registeredExpenses.map((e) => Text(e.title)).toList(),
        ),
      ),
    );
  }
}