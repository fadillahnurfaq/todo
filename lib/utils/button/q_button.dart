import 'package:flutter/material.dart';

import '../colors.dart';

class QButton extends StatelessWidget {
  final Color? splashColor;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback onTap;
  const QButton(
      {super.key,
      required this.backgroundColor,
      required this.text,
      this.splashColor,
      required this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: splashColor ?? orangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 14.0, color: textColor),
        ),
      ),
    );
  }
}
