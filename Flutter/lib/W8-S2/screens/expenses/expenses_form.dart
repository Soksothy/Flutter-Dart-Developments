import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../model/expense.dart';
import 'package:intl/intl.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onSubmit});

  final void Function(Expense expense) onSubmit;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category? _selectedCategrory = Category.food;
  DateTime? _selectedDate; // Initialize to null

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onAddPressed() {
    final title = _titleController.text.trim();

    if (title.isEmpty) {
      _showError('Invalid title', '🥲 title');
      return;
    } else if (title.length < 3) {
      _showError('Invalid title', 'least 3 characters :)');
      return;
    } else if (title.length > 50) {
      _showError('Invalid title', 'too much :)');
      return;
    } else if (title == 'love') {
      _showError('No love 💘', '🥲');
      return;
    }

    double? amount;
    try {
      amount = double.parse(_valueController.text);
    } catch (e) {
      _showError('Invalid amount', ' 👉 valid amount');
      return;
    }

    if (_selectedDate == null) {
      _showError('No date selected', 'Please select a date');
      return;
    }

    final expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategrory ?? Category.food,
    );

    widget.onSubmit(expense);
    Navigator.pop(context);
  }

  void _showDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now, // Use current date as initialDate
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _showError(String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: _showDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'No date selected'
                              : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownButton<Category>(
            value: _selectedCategrory,
            isExpanded: true,
            onChanged: (Category? newValue) {
              setState(() {
                _selectedCategrory = newValue;
              });
            },
            items: Category.values
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase()),
                    ))
                .toList(),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 32, 219, 104),
                  ),
                  onPressed: onAddPressed,
                  child: const Text('Save'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

