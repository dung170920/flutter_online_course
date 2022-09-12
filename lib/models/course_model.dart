import 'package:online_course/models/models.dart';

class CourseModel {
  final String? title;
  final String? teacherName;
  final String? teacherImage;
  final String? courseImage;
  final String? coursePrice;
  final int? numberOfLessons;
  final String? courseDuration;
  final String? courseDescription;
  final String? courseProgressValue;
  final List<String>? sliderImages;
  final List<LessonModel>? lessons;

  CourseModel({
    this.title,
    this.teacherName,
    this.teacherImage,
    this.courseImage,
    this.coursePrice,
    this.numberOfLessons,
    this.courseDuration,
    this.courseDescription,
    this.courseProgressValue,
    this.sliderImages,
    this.lessons,
  });
}

List<CourseModel> courses = [
  CourseModel(
    title: 'UI/UX Design',
    teacherName: "Samanta Yasamin",
    teacherImage:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    courseImage:
        'https://images.unsplash.com/photo-1587440871875-191322ee64b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXglMjBkZXNpZ258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    coursePrice: '\$150',
    numberOfLessons: 12,
    courseDuration: '1h 15m',
    courseDescription:
        'The UI/UX Design Specialization brings a design centric approach to user interface and user experience design, and offers practical, skill-based instruction centered around a visual communications perspective, rather than on one focused on marketing or programming alone.',
    courseProgressValue: '60',
    sliderImages: [
      'assets/images/ui-ux-design.jpg',
      'assets/images/coding.jpg',
      'assets/images/marketing.jpg'
    ],
    lessons: lessons,
  ),
  CourseModel(
    title: 'HTML & CSS',
    teacherName: "Alexander",
    teacherImage:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    courseImage:
        'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29kaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    coursePrice: '\$150',
    numberOfLessons: 20,
    courseDuration: '2h 10m',
    courseDescription:
        'The UI/UX Design Specialization brings a design centric approach to user interface and user experience design, and offers practical, skill-based instruction centered around a visual communications perspective, rather than on one focused on marketing or programming alone.',
    courseProgressValue: '50',
    sliderImages: [
      'assets/images/ui-ux-design.jpg',
      'assets/images/coding.jpg',
      'assets/images/marketing.jpg'
    ],
    lessons: lessons,
  )
];
