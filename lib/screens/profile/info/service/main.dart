import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/service.dart';
import 'package:brandu/providers/services.dart';
import 'package:brandu/screens/profile/info/service/faq/main.dart';
import 'package:brandu/screens/profile/info/service/inquiry/main.dart';
import 'package:brandu/screens/profile/info/service/main-info/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/button-box.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/base/title-box.dart';
import 'package:brandu/widgets/header-icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'inquiry/answer.dart';

class ServiceCenterPage extends StatefulWidget {
  const ServiceCenterPage({Key? key}) : super(key: key);

  @override
  State<ServiceCenterPage> createState() => _ServiceCenterPageState();
}

class _ServiceCenterPageState extends State<ServiceCenterPage> {
  late Future<Services> services;

  @override
  void initState() {
    super.initState();
    services = ServiceClient().getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        leading: Row(
          children: [
            backIcon(),
            homeIcon(),
          ],
        ),
        title: '고객센터',
        actions: const <Widget>[],
      ),
      body: Column(
        children: [
          /// 검색 화면
          // Container(
          //   decoration: bottomBorder(),
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(
          //       horizontal: 15,
          //       vertical: 20,
          //     ),
          //     child: SearchBox(controller),
          //   ),
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder<Services>(
                future: services,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        TitleBox(
                          '서비스 주요안내',
                          snapshot.requireData.main_infos
                              .map(
                                (mainInfo) => GestureDetector(
                                  onTap: () {
                                    Get.to(() => const MainInfoPage());
                                  },
                                  child: SmallText(mainInfo.title, greyColor),
                                ),
                              )
                              .toList(),
                        ),
                        TitleBox(
                          '자주 묻는 질문',
                          snapshot.requireData.faqs
                              .map(
                                (faq) => GestureDetector(
                                  onTap: () {
                                    Get.to(() => const FAQPage());
                                  },
                                  child: SmallText(faq.title, greyColor),
                                ),
                              )
                              .toList(),
                        ),
                        snapshot.requireData.inquiries != null
                            ? (TitleBox(
                                '1:1 문의내역',
                                snapshot.requireData.inquiries!
                                    .map(
                                      (inquiry) => GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              () => InquiryAnswerPage(inquiry));
                                        },
                                        child: SmallText(
                                            '${inquiry.is_answer ? "[답변완료]" : "[답변미완료]"} ${inquiry.title}',
                                            greyColor),
                                      ),
                                    )
                                    .toList(),
                              ))
                            : Container(),
                      ],
                    );
                  }
                  return SizedBox(
                    height: 500,
                    child: indicator(),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: ButtonBox('1:1 문의하기', () {
              Get.to(() => const ServiceInquiryPage());
            }),
          )
        ],
      ),
    );
  }
}
