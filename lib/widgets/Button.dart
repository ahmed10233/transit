import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // Renamed class to avoid confusion with built-in Button
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.horizontal,
      required this.vertical});

  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your button action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded edges
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical, // Button padding
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor, // Text color
          fontSize: 12, // Text size
        ),
      ),
    ); // Added missing semicolon here
  }
}
