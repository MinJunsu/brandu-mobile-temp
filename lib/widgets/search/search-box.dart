import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchBox(TextEditingController controller) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: '검색어를 입력해주세요',
                hintStyle: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(width: 1, color: mainColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(width: 1, color: mainColor),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: MediumText('취소', Colors.black),
          ),
        )
      ],
    ),
  );
}
