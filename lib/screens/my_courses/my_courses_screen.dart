import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/models/models.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'My Courses',
                style: TextStyle(
                    color: ThemeColors.black,
                    fontSize: getProportionateScreenWidth(17)),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                '4 courses',
                style: TextStyle(
                    color: ThemeColors.primary,
                    fontSize: getProportionateScreenWidth(13)),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                'assets/icons/search.svg',
                color: ThemeColors.greyDark,
                width: getProportionateScreenWidth(24),
                height: getProportionateScreenWidth(24),
              ),
              onPressed: () {
                // Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: courses.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            top: getProportionateScreenHeight(25),
            bottom: getProportionateScreenHeight(15),
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20)),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: AspectRatio(
              aspectRatio: 2.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: ThemeColors.grey,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:
                                    NetworkImage(courses[index].courseImage!),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(courses[index].title!,
                              style: TextStyle(
                                  color: ThemeColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(16))),
                          SizedBox(
                            height: getProportionateScreenHeight(8),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          courses[index].teacherImage!),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(width: getProportionateScreenWidth(4)),
                              Text(
                                courses[index].teacherName!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: ThemeColors.greyDark,
                                  fontSize: getProportionateScreenWidth(14),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            width: 180,
                            animation: true,
                            lineHeight: 18,
                            animationDuration: 3000,
                            percent: double.tryParse(courses[index]
                                    .courseProgressValue
                                    .toString())! /
                                100,
                            center: Text(
                              '${courses[index].courseProgressValue}%',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            barRadius: const Radius.circular(20),
                            progressColor: ThemeColors.secondary,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: getProportionateScreenHeight(15));
        },
      ),
    );
  }
}
