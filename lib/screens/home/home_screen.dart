import 'package:flutter/material.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/screens/home/widgets/categories.dart';
import 'package:online_course/screens/home/widgets/courses.dart';
import 'package:online_course/screens/home/widgets/my_appbar.dart';
import 'package:online_course/screens/home/widgets/popular_courses.dart';
import 'package:online_course/screens/home/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: MyAppbar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              Searchbar(),
              Categories(),
              Courses(),
              PopularCourses()
            ],
          ),
        ),
      ),
    );
  }
}
