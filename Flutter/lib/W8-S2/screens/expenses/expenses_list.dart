import 'package:flutter/material.dart';
import '../../model/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: expenses.isEmpty
          ? const Center(
              child: Text(
                'Erorr 404 not found',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            )
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) => Dismissible(
                key: ValueKey(expenses[index].id),
                background: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 2, 7, 3),
                    ),
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  onRemoveExpense(expenses[index]);
                },
                child: ExpenseItem(expenses[index]),
              ),
            ),
    );
  }
}
