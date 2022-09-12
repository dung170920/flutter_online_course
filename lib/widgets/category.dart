import 'package:flutter/material.dart';
import 'package:online_course/models/models.dart';

class Category extends StatelessWidget {
  const Category(
      {super.key,
      required this.category,
      required this.textColor,
      this.borderColor,
      required this.bgColor});

  final CategoryModel category;
  final Color textColor;
  final Color? borderColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor ?? Colors.transparent)),
      child: Center(
        child: Text(
          category.title,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
