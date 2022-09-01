import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Container boxContainer(Widget child, double height, color) {
  return Container(
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color,
    ),
    child: child,
  );
}

Container getLoginButton(onPressed, String icon, String text) {
  return boxContainer(
      TextButton.icon(
        onPressed: onPressed,
        label: MediumText(text, Colors.grey),
        icon: SvgPicture.asset(icon),
      ),
      46,
      Colors.white);
}

Container getGreyBoxButton(onPressed, String text) {
  return boxContainer(
    Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediumBoldText('약관 전체동의', Colors.black),
            SizedBox(
              width: 20,
              height: 20,
              child: Material(
                  child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                value: true,
                activeColor: mainColor,
                onChanged: (bool? checked) {},
              )),
            )
          ],
        )),
    46,
    const Color.fromARGB(100, 248, 248, 250),
  );
}

Widget getLabelButton(onPressed, String icon, String title, Color color,
    {isNetwork = false}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        width: 50,
        height: 50,
        child: isNetwork ? SvgPicture.network(icon, fit: BoxFit.scaleDown,) : SvgPicture.asset(
          icon,
          fit: BoxFit.scaleDown,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      SmallBoldText(title, color),
    ],
  );
}
