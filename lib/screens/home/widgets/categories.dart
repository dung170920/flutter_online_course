import 'package:flutter/material.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/models/models.dart';
import 'package:online_course/widgets/category.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6,
      child: Container(
        margin: EdgeInsets.only(
          top: getProportionateScreenHeight(10),
          left: getProportionateScreenWidth(12),
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Category(
              category: categories[index],
              bgColor: currentIndex == index
                  ? ThemeColors.secondary
                  : Colors.transparent,
              borderColor: currentIndex == index
                  ? Colors.transparent
                  : ThemeColors.greyDark,
              textColor:
                  currentIndex == index ? Colors.white : ThemeColors.greyDark,
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          padding: const EdgeInsets.all(8),
          itemCount: categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
