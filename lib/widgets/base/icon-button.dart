import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget iconButton(onPressed, String icon, String name, int count) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      children: [
        SvgPicture.asset(
          icon,
          fit: BoxFit.fitHeight,
          height: 18,
        ),
        const SizedBox(
          height: 3,
        ),
        XSmallText(
          name,
          greyColor,
        ),
        const SizedBox(
          height: 5,
        ),
        SmallBoldText(
          count.toString(),
          Colors.black,
        ),
      ],
    ),
  );
}
