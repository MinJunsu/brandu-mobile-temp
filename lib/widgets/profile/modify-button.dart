import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';

class ModifyButton extends StatelessWidget {
  final dynamic onPressed;
  const ModifyButton(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.bottomRight,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: mainColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          width: 32,
          height: 22,
          child: XSmallText('수정', mainColor),
        ),
      ),
    );
  }
}
