import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String title;
  final dynamic onPressed;
  const CustomSnackBar({Key? key, required this.title, required this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: SmallText(title, Colors.black),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        label: '이동하기',
        disabledTextColor: Colors.white,
        textColor: Colors.yellow,
        onPressed: onPressed,
      ),
    );
  }
}
