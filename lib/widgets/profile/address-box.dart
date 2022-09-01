import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/screens/profile/order/address/modify.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/small-button-box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressBox extends StatelessWidget {
  final Address address;
  const AddressBox(this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bottomBorder(),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MediumText(address.name, Colors.black),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 32,
                      height: 22,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: XSmallBoldText.withoutColor('대표'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 70,
                  height: 30,
                  child: SmallButtonBox(
                    title: '수정하기',
                    onPressed: () {
                      Get.to(() => AddressModifyPage(address));
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                  child: SmallText('받는분', greyColor),
                ),
                const SizedBox(
                  width: 25,
                ),
                SmallText(address.recipient, Colors.black),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                  child: SmallText('연락처', greyColor),
                ),
                const SizedBox(
                  width: 25,
                ),
                SmallText(address.phone_number, Colors.black),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                  child: SmallText('주소', greyColor),
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                        '[${address.zip_code}] ${address.road_name_address}',
                        Colors.black),
                    SmallText(address.detail_address, Colors.black),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
