import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/utilities/formater.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/header.dart';
import 'package:brandu/widgets/profile/ordered-box.dart';
import 'package:brandu/widgets/profile/title-address-box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderPage extends StatefulWidget {
  final List<Bucket> buckets;
  final int sumPrice;
  const OrderPage({
    Key? key,
    required this.buckets,
    required this.sumPrice,
  }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool visibility = false;
  late Future<List<Address>> addresses;
  int index = 0;

  @override
  void initState() {
    super.initState();
    addresses = AccountsClient().getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createHeader(
        isBack: true,
        title: '주문 및 결제',
      ),
      body: FutureBuilder<List<Address>>(
        future: addresses,
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: lightGreyColor,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75),
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              visibility = !visibility;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText('주문내역', Colors.black),
                              Container(
                                child: visibility
                                    ? SvgPicture.asset(
                                        'assets/icons/up-arrow.svg')
                                    : SvgPicture.asset(
                                        'assets/icons/down-arrow.svg'),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          maintainSize: false,
                          visible: visibility,
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                Bucket bucket = widget.buckets[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SmallText(bucket.product.name, greyColor),
                                      SmallText(
                                          '${bucket.amount}개', Colors.black),
                                    ],
                                  ),
                                );
                              },
                              itemCount: widget.buckets.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        OrderedBox(),
                        BadgeAddressBox(
                          index: index,
                          addresses: snapshot.requireData,
                          onPressed: (number) {
                            setState(() {
                              index = number;
                            });
                          },
                        ),
                      ],
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
                              SmallText(
                                  '${currencyFormat.format(widget.sumPrice)}원',
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
                                  '${currencyFormat.format(widget.sumPrice + 3000)}원',
                                  Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: boxContainer(
                              Container(
                                alignment: Alignment.center,
                                child: SmallBoldText.withoutColor('결제하기'),
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
        },
      ),
    );
  }
}
