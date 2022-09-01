import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/service.dart';
import 'package:brandu/screens/profile/info/service/inquiry/modify.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/button-box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryAnswerPage extends StatelessWidget {
  final Inquiry inquiry;
  const InquiryAnswerPage(this.inquiry, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '1:1 문의내역',
        actions: const <Widget>[],
      ),
      body: Column(
        children: [
          Container(
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
                      inquiry.is_answer
                          ? MediumBoldText('[답변완료]', mainColor)
                          : MediumBoldText('[답변미완료]', Colors.black),
                      SizedBox(
                        width: 75,
                        height: 35,
                        child: ButtonBox(
                          '수정하기',
                          () {
                            Get.to(() => InquiryModifyPage(inquiry));
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MediumBoldText(inquiry.title, Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  SmallText(inquiry.description, Colors.black),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText('답변 내용', Colors.black),
                SmallText('123123', Colors.black),
              ],
            ),
          )
        ],
      ),
    );
  }
}
