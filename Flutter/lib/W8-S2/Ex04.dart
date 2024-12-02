import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    theme:ThemeData(
      primarySwatch: Colors.blue,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        filled: true,
      ),
    ),
    home: CurrencyConverter(),
    debugShowCheckedModeBanner: false,
  ));
}

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final _controller = TextEditingController();
  final _currencies = ['euro', 'riels', 'dong'];
  String _selectedCurrency = 'euro';
  double _dollarAmount = 0.0;

  final Map<String, double> _conversionRates = {
    'euro': 0.85,
    'riels': 4000.0,
    'dong': 23000.0,
  };

  final Map<String, String> _currencySymbols = {
    'euro': '€',
    'riels': '៛',
    'dong': '₫',
  };

  String _formatAmount(double amount) {
    return NumberFormat.currency(
      decimalDigits: 2,
      symbol: _currencySymbols[_selectedCurrency],
    ).format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo[600],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo[600]!, const Color.fromARGB(255, 40, 94, 194)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _controller,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: const InputDecoration(
                            labelText: 'Amount in USD',
                            icon: Icon(Icons.attach_money),
                            hintText: 'Enter amount',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _dollarAmount = double.tryParse(value) ?? 0.0;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey[300]!),
                            color: Colors.grey[50],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedCurrency,
                              isExpanded: true,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              borderRadius: BorderRadius.circular(10),
                              items: _currencies.map((currency) {
                                return DropdownMenuItem(
                                  value: currency,
                                  child: Text(
                                    currency.toUpperCase(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedCurrency = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Converted Amount',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _formatAmount(_dollarAmount * _conversionRates[_selectedCurrency]!),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[700],
                          ),
                        ),
                        Text(
                          _selectedCurrency.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
