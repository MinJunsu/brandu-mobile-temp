import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';

Widget getAdvertisment(String image, int number, int size) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(image), // 배경 이미지
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.bottomRight,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: 45,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromRGBO(0, 0, 0, 0.3),
          ),
          child: XSmallText.withoutColor('$number/$size'),
        ),
      ),
    ),
  );
}
