import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/base/toggle-button.dart';
import 'package:brandu/widgets/header-icon.dart';
import 'package:flutter/material.dart';

class ProfileNotifyPage extends StatefulWidget {
  const ProfileNotifyPage({Key? key}) : super(key: key);

  @override
  State<ProfileNotifyPage> createState() => _ProfileNotifyPageState();
}

class _ProfileNotifyPageState extends State<ProfileNotifyPage> {
  late Future<Notify> notify;

  @override
  void initState() {
    super.initState();
    notify = AccountsClient().getNotify();
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
        title: '알림설정',
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
                  MediumText('푸시 알림 설정', Colors.black),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallBoldText('휴대폰 설정 - 알림 - 브랜뉴', mainColor),
                      SmallText('에서 설정 변경', greyColor),
                    ],
                  )
                ],
              ),
            ),
          ),
          FutureBuilder<Notify>(
            future: notify,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      decoration: bottomBorder(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              child: MediumText('스토어 알림', Colors.black),
                            ),
                            ToggleButton(
                                initialValue: snapshot.requireData.is_store,
                                onChanged: () {}),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: bottomBorder(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              child: MediumText('커뮤니티 알림', Colors.black),
                            ),
                            ToggleButton(
                                initialValue: snapshot.requireData.is_community,
                                onChanged: () {}),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: bottomBorder(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              child: MediumText('이벤트 및 혜택 알림', Colors.black),
                            ),
                            ToggleButton(
                                initialValue: snapshot.requireData.is_event,
                                onChanged: () {}),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return SizedBox(
                height: 500,
                child: indicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
