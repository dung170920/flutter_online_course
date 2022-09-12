import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/models/models.dart';
import 'package:online_course/screens/course_detail/widgets/course_infomation.dart';
import 'package:online_course/screens/course_detail/widgets/course_lesson.dart';
import 'package:online_course/screens/course_detail/widgets/course_review.dart';
import 'package:online_course/screens/course_detail/widgets/image_slider.dart';
import 'package:online_course/widgets/widgets.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key, required this.course});

  final CourseModel course;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Container(
          height: getProportionateScreenWidth(36),
          width: getProportionateScreenWidth(36),
          margin: EdgeInsets.only(left: getProportionateScreenWidth(20)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ThemeColors.grey),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ThemeColors.greyDark,
                size: 16,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          'Course Details',
          style: TextStyle(
              color: ThemeColors.black,
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            height: getProportionateScreenWidth(36),
            width: getProportionateScreenWidth(36),
            margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ThemeColors.grey),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                color: ThemeColors.greyDark,
                width: getProportionateScreenWidth(24),
                height: getProportionateScreenWidth(24),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                ImageSlider(course: widget.course),
                CourseInformation(course: widget.course),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                TabBar(
                  controller: controller,
                  unselectedLabelColor: ThemeColors.greyDark,
                  labelColor: ThemeColors.black,
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  tabs: [
                    Tab(
                      child: Text(
                        'Lessons',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenWidth(14),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Reviews',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenWidth(14),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: SizeConfig.screenHeight,
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(20),
                  ),
                  child: TabBarView(
                    controller: controller,
                    children: [
                      CourseLessons(lessons: widget.course.lessons!),
                      const CourseReview()
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Button(
                    text: 'Enroll Now', onPressed: () {}, isActive: true),
              ),
            )
          ],
        ),
      ),
    );
  }
}
