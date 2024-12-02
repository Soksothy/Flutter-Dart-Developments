import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    switch (buttonType) {
      case ButtonType.primary:
        buttonColor = Colors.blueAccent;
        break;
      case ButtonType.secondary:
        buttonColor = Colors.green;
        break;
      case ButtonType.disabled:
        buttonColor = Colors.grey;
        break;
    }

    return ElevatedButton.icon(
      icon: iconPosition == IconPosition.left
          ? Icon(icon)
          : const SizedBox.shrink(),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        minimumSize: const Size(
            double.infinity, 50), // Make button full width with a fixed height
      ),
      onPressed: buttonType == ButtonType.disabled ? null : () {},
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Buttons')),
        body: const Center(
          // Center the column in the body
          child: SingleChildScrollView(
            // Allow scrolling if the buttons exceed screen height
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  label: 'Primary Button',
                  icon: Icons.check,
                  buttonType: ButtonType.primary,
                  iconPosition: IconPosition.left,
                ),
                SizedBox(height: 20), // Add space between buttons
                CustomButton(
                  label: 'Secondary Button',
                  icon: Icons.check_circle,
                  iconPosition: IconPosition.right,
                  buttonType: ButtonType.secondary,
                ),
                SizedBox(height: 20), // Add space between buttons
                CustomButton(
                  label: 'Disabled Button',
                  icon: Icons.block,
                  iconPosition: IconPosition.right,
                  buttonType: ButtonType.disabled,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
