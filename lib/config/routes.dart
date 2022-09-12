import 'package:flutter/material.dart';
import 'package:online_course/screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const MainScreen(),
  '/home': (context) => const HomeScreen(),
};
