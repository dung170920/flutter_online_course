import 'package:flutter/material.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/models/models.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: PageView.builder(
        itemCount: course.sliderImages!.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        controller: PageController(
            viewportFraction: 0.8, keepPage: true, initialPage: 1),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.fromLTRB(0, 20, 10, 10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  course.sliderImages![index],
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              index == 1
                  ? Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(15),
                          bottom: getProportionateScreenHeight(14),
                        ),
                        height: getProportionateScreenHeight(35),
                        width: getProportionateScreenWidth(140),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                course.courseDuration!,
                                style: TextStyle(
                                  color: ThemeColors.black,
                                  fontSize: getProportionateScreenWidth(12),
                                ),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                    color: ThemeColors.primary,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              Text(
                                '${course.numberOfLessons} lessons',
                                style: TextStyle(
                                  color: ThemeColors.black,
                                  fontSize: getProportionateScreenWidth(12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
