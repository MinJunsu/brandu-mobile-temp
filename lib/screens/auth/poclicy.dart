import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/screens/home/main.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:brandu/widgets/base/check-box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  bool essentialPolicy = false;
  bool optionalPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.asset('assets/icons/back-green.svg'),
              ),
              const SizedBox(height: 40),
              SvgPicture.asset('assets/icons/logo-green.svg'),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LargeText('브랜뉴가 처음이세요?', mainColor),
                  LargeText('이용약관에 동의해주세요', mainColor),
                ],
              ),
              const SizedBox(height: 20),
              boxContainer(
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MediumBoldText('약관 전체동의', Colors.black),
                        circleCheckBox(essentialPolicy && optionalPolicy,
                            (value) {
                          setState(() {
                            essentialPolicy = value;
                            optionalPolicy = value;
                          });
                        }),
                      ],
                    )),
                46,
                const Color.fromARGB(100, 248, 248, 250),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MediumBoldText('필수 약관 전체동의', Colors.black),
                    circleCheckBox(essentialPolicy, (value) {
                      setState(() {
                        essentialPolicy = value;
                      });
                    })
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    MediumText(
                      '(필수) 브랜뉴 이용약관',
                      greyColor,
                    ),
                    MediumText(
                      '(필수) 전자금융거래 이용약관',
                      greyColor,
                    ),
                    MediumText(
                      '(필수) 개인정보 수집/이용 동의',
                      greyColor,
                    ),
                    MediumText(
                      '(필수) 본인확인서비스 이용약관',
                      greyColor,
                    ),
                    MediumText(
                      '(필수) 통신사 이용약관',
                      greyColor,
                    ),
                    MediumText(
                      '(필수) 통신사 개읹ㅇ보 수집/이용 동의',
                      greyColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MediumBoldText('이벤트 광고수신(선택)', Colors.black),
                    circleCheckBox(optionalPolicy, (value) {
                      setState(() {
                        optionalPolicy = value;
                      });
                    })
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              boxContainer(
                GestureDetector(
                  onTap: () {
                    if (essentialPolicy && optionalPolicy) {
                      Get.to(() => const HomePage());
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: MediumBoldText.withoutColor('동의하기'),
                  ),
                ),
                45,
                (essentialPolicy && optionalPolicy)
                    ? mainColor
                    : lightGreyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
