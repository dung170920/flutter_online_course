import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/config/config.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(20),
          horizontal: getProportionateScreenWidth(10)),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                color: ThemeColors.black,
                fontWeight: FontWeight.w400,
                fontSize: getProportionateScreenWidth(14),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(6),
            ),
            Text(
              'Mahdi Nazmi',
              style: TextStyle(
                color: ThemeColors.black,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            height: getProportionateScreenWidth(36),
            width: getProportionateScreenWidth(36),
            decoration: BoxDecoration(
                border: Border.all(color: ThemeColors.grey),
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {},
              icon: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/icons/bell.svg",
                    width: getProportionateScreenWidth(24),
                    height: getProportionateScreenWidth(24),
                  ),
                  Positioned(
                    right: 2,
                    top: 3,
                    child: Container(
                      width: getProportionateScreenWidth(6),
                      height: getProportionateScreenWidth(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(60),
            width: getProportionateScreenWidth(60),
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGF2YXRhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
