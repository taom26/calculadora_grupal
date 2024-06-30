// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.label,
    this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    TextStyle buttonTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color:
          isDarkMode ? Colors.black : const Color.fromARGB(255, 104, 103, 103),
    );

    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(20.0),
          textStyle: buttonTextStyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: icon != null
            ? Icon(icon, color: buttonTextStyle.color)
            : Text(
                label!,
                style: buttonTextStyle,
              ),
      ),
    );
  }
}
