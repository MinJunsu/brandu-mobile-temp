import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/event.dart';
import 'package:brandu/providers/events.dart';
import 'package:brandu/screens/profile/info/coupon/register.dart';
import 'package:brandu/utilities/formater.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/button-box.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/header-icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  late Future<List<CouponHold>> coupons;

  @override
  void initState() {
    super.initState();
    coupons = EventClient().getCoupons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Row(
          children: [
            backIcon(),
            homeIcon(),
          ],
        ),
        appBar: AppBar(),
        title: '쿠폰 내역',
        actions: const <Widget>[],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: bottomBorder(),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: SmallText('보유 쿠폰 4개', Colors.black),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder<List<CouponHold>>(
                future: coupons,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MediumText(
                                        snapshot.requireData[index].coupon.name,
                                        Colors.black),
                                    XSmallText('적용상품 목록', greyColor),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SmallText(
                                  '${baseDateFormat.format(snapshot.requireData[index].created)}~${baseDateFormat.format(snapshot.requireData[index].created.add(Duration(days: snapshot.requireData[index].coupon.expiration_period)))}',
                                  greyColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container();
                      },
                      itemCount: snapshot.requireData.length,
                    );
                  }
                  return indicator();
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: ButtonBox('쿠폰 등록', () {
              Get.to(() => const CouponRegisterPage());
            }),
          )
        ],
      ),
    );
  }
}
