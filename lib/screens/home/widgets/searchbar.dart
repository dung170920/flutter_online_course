import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/config/config.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: TextField(
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: ThemeColors.black,
              ),
              cursorColor: ThemeColors.primary,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Search any course',
                hintStyle: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  color: ThemeColors.greyDark,
                ),
                filled: true,
                fillColor: ThemeColors.greyLight,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    color: ThemeColors.greyDark,
                  ),
                ),
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              decoration: const BoxDecoration(
                color: ThemeColors.greyLight,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: SvgPicture.asset(
                  'assets/icons/filter.svg',
                  color: ThemeColors.primary,
                  width: getProportionateScreenWidth(24),
                  height: getProportionateScreenWidth(24),
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
