import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/widgets/base/small-button-box.dart';
import 'package:flutter/material.dart';

class OrderedBox extends StatelessWidget {
  const OrderedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              MediumText('주문자', Colors.black),
              SizedBox(
                width: 70,
                height: 30,
                child: SmallButtonBox(title: '수정하기', onPressed: () {}),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
                child: SmallText('보내는 분', greyColor),
              ),
              const SizedBox(
                width: 20,
              ),
              SmallText('userName', Colors.black),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
                child: SmallText('연락처', greyColor),
              ),
              const SizedBox(
                width: 20,
              ),
              SmallText('phoneNumber', Colors.black),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
                child: SmallText('이메일', greyColor),
              ),
              const SizedBox(
                width: 20,
              ),
              SmallText('email', Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
