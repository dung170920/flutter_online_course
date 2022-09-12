import 'package:flutter/material.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/models/models.dart';
import 'package:online_course/screens/screens.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.25,
      child: Container(
        margin: EdgeInsets.only(
          top: getProportionateScreenHeight(10),
        ),
        color: Colors.transparent,
        child: ListView.separated(
          itemCount: courses.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) => GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: ThemeColors.grey,
                    blurRadius: 8,
                    offset: Offset(4, 8),
                  ),
                ],
              ),
              width: getProportionateScreenWidth(220),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.45,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(courses[index].courseImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          courses[index].title!,
                          style: TextStyle(
                            color: ThemeColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(16),
                          ),
                        ),
                        Text(
                          courses[index].coursePrice!,
                          style: TextStyle(
                            color: ThemeColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(12)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(courses[index].teacherImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(8)),
                        Text(
                          courses[index].teacherName!,
                          style: TextStyle(
                            color: ThemeColors.greyDark,
                            fontSize: getProportionateScreenWidth(12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(courses[index].courseDuration!,
                            style: TextStyle(
                                color: ThemeColors.greyDark,
                                fontSize: getProportionateScreenWidth(14))),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                              color: ThemeColors.primary,
                              shape: BoxShape.circle),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Text("${courses[index].numberOfLessons!} lessons",
                            style: TextStyle(
                                color: ThemeColors.greyDark,
                                fontSize: getProportionateScreenWidth(14))),
                      ],
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    course: courses[index],
                  ),
                ),
              );
            },
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: getProportionateScreenWidth(10),
          ),
        ),
      ),
    );
  }
}
