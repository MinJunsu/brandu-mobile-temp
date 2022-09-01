import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/screens/order/main.dart';
import 'package:brandu/utilities/formater.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:brandu/widgets/base/check-box.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/profile/bucket-box.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BucketPage extends StatefulWidget {
  const BucketPage({Key? key}) : super(key: key);

  @override
  State<BucketPage> createState() => _BucketPageState();
}

class _BucketPageState extends State<BucketPage> {
  late Future<List<Bucket>> buckets;
  List<int> counts = [];
  int orderPrice = 0;
  List<bool> checkedList = [];

  @override
  void initState() {
    super.initState();
    buckets = AccountsClient().getBuckets();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Bucket>>(
        future: buckets,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (counts.isEmpty) {
              checkedList =
                  List<bool>.filled(snapshot.requireData.length, true);
              counts = snapshot.requireData.map((e) => e.amount).toList();
            }
            orderPrice = snapshot.requireData
                .mapIndexed(
                    (index, element) => element.product.price * counts[index])
                .sum;
            return Column(
              children: [
                Container(
                  decoration: bottomBorder(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: boxContainer(
                        Row(
                          children: [
                            circleCheckBox(
                              checkedList.every((element) => element),
                              (isChecked) {
                                setState(() {
                                  checkedList = List<bool>.filled(
                                      checkedList.length, isChecked);
                                });
                              },
                            ),
                            MediumBoldText('전체 선택/해제', Colors.black),
                          ],
                        ),
                        45,
                        lightMainColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BucketBox(
                          bucket: snapshot.requireData[index],
                          checked: checkedList[index],
                          setChecked: (isChecked) {
                            setState(() {
                              checkedList[index] = isChecked;
                            });
                          },
                          count: counts[index],
                          add: () {
                            setState(() {
                              counts[index]++;
                            });
                          },
                          sub: () {
                            setState(() {
                              if (counts[index] > 1) {
                                counts[index]--;
                              }
                            });
                          },
                        );
                      },
                      itemCount: snapshot.requireData.length,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 65,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText('주문 금액', greyColor),
                              SmallText('${currencyFormat.format(orderPrice)}원',
                                  Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText('배송비', greyColor),
                              SmallText('3,000원', Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText('합계금액', greyColor),
                              MediumBoldText(
                                  '${currencyFormat.format(orderPrice + 3000)}원',
                                  Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => OrderPage(
                                  buckets: List<Bucket>.from(
                                    snapshot.requireData.mapIndexed(
                                      (index, element) => Bucket(
                                        id: element.id,
                                        product: element.product,
                                        amount: counts[index],
                                        is_purchase: element.is_purchase,
                                      ),
                                    ),
                                  ),
                                  sumPrice: orderPrice,
                                ),
                              );
                            },
                            child: boxContainer(
                              Container(
                                alignment: Alignment.center,
                                child: SmallBoldText.withoutColor('구매하기'),
                              ),
                              45,
                              mainColor,
                            ),
                          ),
                        ],
                      ),
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
        });
  }
}
