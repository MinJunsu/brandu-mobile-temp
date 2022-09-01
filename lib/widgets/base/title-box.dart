import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const TitleBox(this.title, this.children, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bottomBorder(),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MediumText(title, Colors.black),
                XSmallText('전체 보기', greyColor),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              direction: Axis.vertical,
              spacing: 5,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
