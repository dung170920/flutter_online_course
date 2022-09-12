import 'package:flutter/material.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/models/models.dart';
import 'package:online_course/screens/screens.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(15),
        left: getProportionateScreenWidth(15),
        right: getProportionateScreenWidth(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Course',
                style: TextStyle(
                    color: ThemeColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenHeight(18)),
              ),
              Text(
                'See All',
                style: TextStyle(
                    color: ThemeColors.greyDark,
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenHeight(14)),
              )
            ],
          ),
          ListView.separated(
            itemCount: courses.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(20),
                bottom: getProportionateScreenHeight(15)),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
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
                child: AspectRatio(
                  aspectRatio: 2.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ThemeColors.grey, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            courses[index].courseImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(8),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      courses[index].title!,
                                      style: TextStyle(
                                        color: ThemeColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(8)),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    courses[index]
                                                        .teacherImage!),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        SizedBox(
                                            width:
                                                getProportionateScreenWidth(4)),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(110),
                                          child: Text(
                                            courses[index].teacherName!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: ThemeColors.greyDark,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      12),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(8)),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(courses[index].courseDuration!,
                                            style: TextStyle(
                                                color: ThemeColors.greyDark,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12))),
                                        SizedBox(
                                            width:
                                                getProportionateScreenWidth(5)),
                                        Container(
                                          width: 5,
                                          height: 5,
                                          decoration: const BoxDecoration(
                                              color: ThemeColors.primary,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                            width:
                                                getProportionateScreenWidth(5)),
                                        Text(
                                          "${courses[index].numberOfLessons!} lessons",
                                          style: TextStyle(
                                            color: ThemeColors.greyDark,
                                            fontSize:
                                                getProportionateScreenWidth(12),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                courses[index].coursePrice!,
                                style: TextStyle(
                                  color: ThemeColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(16),
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(8),
                              ),
                              const Icon(Icons.arrow_forward_ios, size: 16)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: getProportionateScreenHeight(10));
            },
          )
        ],
      ),
    );
  }
}
