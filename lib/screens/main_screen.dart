import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/config/config.dart';
import 'package:online_course/screens/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int currentIndex = 0;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  Future<bool> onWillPop() {
    if (controller.index == 0) {
      return Future.value(true);
    } else {
      setState(() {
        controller.index = 0;
        currentIndex = 0;
      });
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            const HomeScreen(),
            const MyCoursesScreen(),
            Container(),
            Container(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            controller: controller,
            unselectedLabelColor: ThemeColors.greyDark,
            labelColor: ThemeColors.primary,
            indicatorColor: ThemeColors.primary,
            labelPadding: const EdgeInsets.only(bottom: 4),
            enableFeedback: false,
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: [
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/${currentIndex == 0 ? "home-filled.svg" : "home.svg"}",
                  color: currentIndex == 0
                      ? ThemeColors.primary
                      : ThemeColors.greyDark,
                  width: getProportionateScreenWidth(19),
                  height: getProportionateScreenWidth(19),
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  "assets/icons/${currentIndex == 1 ? "file-list-filled.svg" : "file-list.svg"}",
                  color: currentIndex == 1
                      ? ThemeColors.primary
                      : ThemeColors.greyDark,
                  width: getProportionateScreenWidth(19),
                  height: getProportionateScreenWidth(19),
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/icons/${currentIndex == 2 ? "shopping-cart-filled.svg" : "shopping-cart.svg"}',
                  color: currentIndex == 2
                      ? ThemeColors.primary
                      : ThemeColors.greyDark,
                  width: getProportionateScreenWidth(19),
                  height: getProportionateScreenWidth(19),
                ),
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/icons/${currentIndex == 3 ? "user-filled.svg" : "user.svg"}',
                  color: currentIndex == 3
                      ? ThemeColors.primary
                      : ThemeColors.greyDark,
                  width: getProportionateScreenWidth(19),
                  height: getProportionateScreenWidth(19),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
