import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/utilities/formater.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/header-icon.dart';
import 'package:flutter/material.dart';

class ProfilePointPage extends StatefulWidget {
  const ProfilePointPage({Key? key}) : super(key: key);

  @override
  State<ProfilePointPage> createState() => _ProfilePointPageState();
}

class _ProfilePointPageState extends State<ProfilePointPage> {
  late Future<PointHistory> pointHistory;

  @override
  void initState() {
    super.initState();
    pointHistory = AccountsClient().getPoints();
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
        title: '포인트',
        actions: const <Widget>[],
      ),
      body: FutureBuilder<PointHistory>(
        future: pointHistory,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            MediumText('보유 포인트', Colors.black),
                            XSmallText('BP란?', Colors.grey),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        LargeBoldText(
                            '${currencyFormat.format(snapshot.requireData.point)} BP',
                            Colors.black),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20,
                  ),
                  child: MediumText('적립 및 사용 내역', Colors.black),
                ),
                Container(
                  decoration: bottomBorder(),
                  child: Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                Point point =
                                    snapshot.requireData.point_history[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SmallText(
                                            baseDateFormat
                                                .format(point.created),
                                            greyColor,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          SmallText(
                                            point.memo,
                                            greyColor,
                                          ),
                                        ],
                                      ),
                                      SmallBoldText(
                                        '${point.is_use ? '+' : '-'}${currencyFormat.format(point.point)}',
                                        point.is_use ? Colors.red : mainColor,
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount:
                                  snapshot.requireData.point_history.length,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return indicator();
        },
      ),
    );
  }
}
