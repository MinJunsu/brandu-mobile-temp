import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget userInfoBox(String nickname, String phoneNumber, String email) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 15,
    ),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: lightGreyColor,
          width: 1,
        ),
      ),
    ),
    child: Wrap(
      runSpacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediumText('회원정보', Colors.black),
            Row(
              children: [
                SmallText('수정하기', greyColor),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  'assets/icons/edit.svg',
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            SmallText('닉네임', greyColor),
            const SizedBox(
              width: 20,
            ),
            SmallText(nickname, Colors.black),
          ],
        ),
        Row(
          children: [
            SmallText('연락처', greyColor),
            const SizedBox(
              width: 20,
            ),
            SmallText(phoneNumber, Colors.black),
          ],
        ),
        Row(
          children: [
            SmallText('이메일', greyColor),
            const SizedBox(
              width: 20,
            ),
            SmallText(email, Colors.black),
          ],
        ),
      ],
    ),
  );
}
