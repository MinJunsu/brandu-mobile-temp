import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';

class TagBox extends StatelessWidget {
  final int id;
  final String title;
  const TagBox({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: mainColor,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: SmallText(title, mainColor),
    );
  }
}
