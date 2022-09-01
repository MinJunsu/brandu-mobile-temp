import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';

class ButtonBox extends StatelessWidget {
  final String title;
  final dynamic onPressed;
  const ButtonBox(this.title, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: mainColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: SmallBoldText(title, mainColor),
        ),
      ),
    );
  }
}
