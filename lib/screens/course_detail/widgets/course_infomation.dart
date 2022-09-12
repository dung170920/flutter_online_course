import 'package:flutter/material.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/models/models.dart';

class CourseInformation extends StatefulWidget {
  const CourseInformation({super.key, required this.course});

  final CourseModel course;

  @override
  State<CourseInformation> createState() => _CourseInformationState();
}

class _CourseInformationState extends State<CourseInformation> {
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  @override
  void initState() {
    if (widget.course.courseDescription!.length > 50) {
      firstHalf = widget.course.courseDescription!.substring(0, 70);
      secondHalf = widget.course.courseDescription!
          .substring(70, widget.course.courseDescription!.length);
    } else {
      firstHalf = widget.course.courseDescription;
      secondHalf = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(20),
        right: getProportionateScreenWidth(20),
        left: getProportionateScreenHeight(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.course.title.toString(),
                style: TextStyle(
                  color: ThemeColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(24),
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.course.coursePrice.toString(),
                    style: TextStyle(
                        color: ThemeColors.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(20)),
                  ),
                  Text(
                    '/lifetime',
                    style: TextStyle(
                        color: ThemeColors.greyDark,
                        fontSize: getProportionateScreenWidth(12)),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(8)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(widget.course.teacherImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(6)),
              Text(
                widget.course.teacherName!,
                style: TextStyle(
                  color: ThemeColors.greyDark,
                  fontSize: getProportionateScreenWidth(16),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Descriptions',
                style: TextStyle(
                  color: ThemeColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: getProportionateScreenWidth(14),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              secondHalf!.isEmpty
                  ? Text(firstHalf!)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          flag
                              ? ('${firstHalf!}...')
                              : (firstHalf! + secondHalf!),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: ThemeColors.greyDark,
                            height: 1.5,
                          ),
                        ),
                        GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                flag ? 'Read More' : 'Show Less',
                                style:
                                    const TextStyle(color: ThemeColors.primary),
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(
                              () {
                                flag = !flag;
                              },
                            );
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
