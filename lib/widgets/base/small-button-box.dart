import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';

class SmallButtonBox extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const SmallButtonBox({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: mainColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SmallText(title, mainColor),
      ),
    );
  }
}
