import 'package:brandu/screens/profile/order/address/main.dart';
import 'package:brandu/screens/profile/order/review/main.dart';
import 'package:brandu/screens/profile/order/shipping/main.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/icon-button.dart';
import 'package:brandu/widgets/profile/profile-box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileOrderPage extends StatefulWidget {
  const ProfileOrderPage({Key? key}) : super(key: key);

  @override
  State<ProfileOrderPage> createState() => _ProfileOrderPageState();
}

class _ProfileOrderPageState extends State<ProfileOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: bottomBorder(),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconButton(
                  () {
                    Get.to(() => const ShippingPage());
                  },
                  'assets/icons/bill.svg',
                  '전체',
                  1,
                ),
                iconButton(
                  () {},
                  'assets/icons/complete-payment.svg',
                  '결제완료',
                  1,
                ),
                iconButton(
                  () {},
                  'assets/icons/shipping.svg',
                  '배송 중',
                  0,
                ),
                iconButton(
                  () {},
                  'assets/icons/shipping-complete.svg',
                  '배송 완료',
                  0,
                ),
                iconButton(
                  () {},
                  'assets/icons/confirm.svg',
                  '구매확정',
                  0,
                ),
              ],
            ),
          ),
        ),
        ProfileBox(
          () {
            Get.to(() => const ProfileAddressPage());
          },
          'assets/icons/map.svg',
          '배송지 관리',
        ),
        ProfileBox(
          () {},
          'assets/icons/change.svg',
          '취소/교환/환불 내역',
        ),
        ProfileBox(
          () {
            Get.to(() => const ReviewPage());
          },
          'assets/icons/review.svg',
          '리뷰 관리',
        ),
      ],
    );
  }
}
