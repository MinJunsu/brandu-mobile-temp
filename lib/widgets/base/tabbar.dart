import 'package:flutter/material.dart';

Widget tabHead(String text, {double height = 40}) {
  return SizedBox(
    height: height,
    child: Tab(
      text: text,
    ),
  );
}
