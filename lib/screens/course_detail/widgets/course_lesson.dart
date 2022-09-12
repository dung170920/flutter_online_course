import 'package:flutter/material.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/models/models.dart';

class CourseLessons extends StatelessWidget {
  const CourseLessons({super.key, required this.lessons});

  final List<LessonModel> lessons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        LessonModel lesson = lessons[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ThemeColors.grey, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.play_circle_fill_rounded,
                    color: ThemeColors.secondary,
                    size: 30,
                  ),
                  SizedBox(width: getProportionateScreenWidth(15)),
                  Text(
                    lesson.name!,
                    style: TextStyle(
                      color: ThemeColors.black,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                ],
              ),
              Text(
                lesson.duration!,
                style: TextStyle(
                    color: ThemeColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(14)),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: getProportionateScreenHeight(14),
      ),
      itemCount: lessons.length,
      //shrinkWrap: true,
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(20),
        bottom: getProportionateScreenHeight(60),
      ),
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
