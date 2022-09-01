import 'package:brandu/components/color.dart';
import 'package:flutter/material.dart';

Widget circleCheckBox(bool isChecked, dynamic onChanged) {
  return Checkbox(
    splashRadius: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
    activeColor: mainColor,
    value: isChecked,
    onChanged: onChanged,
  );
}
