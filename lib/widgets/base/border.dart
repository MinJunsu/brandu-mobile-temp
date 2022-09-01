import 'package:brandu/components/color.dart';
import 'package:flutter/material.dart';

Widget getBorder() {
  return Container(
    width: double.infinity,
    height: 1,
    color: lightGreyColor,
  );
}

BoxDecoration bottomBorder() {
  return const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: lightGreyColor,
        width: 1,
      ),
    ),
  );
}
