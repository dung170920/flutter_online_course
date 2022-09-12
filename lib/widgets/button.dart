import 'package:flutter/material.dart';
import 'package:online_course/config/config.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      this.onPressed,
      required this.isActive,
      this.textSize});

  final String text;
  final VoidCallback? onPressed;
  final bool isActive;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10 / 1.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: !isActive ? ThemeColors.greyDark : ThemeColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: isActive ? onPressed : null,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
