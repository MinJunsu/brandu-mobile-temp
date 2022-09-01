import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/screens/profile/info/coupon/main.dart';
import 'package:brandu/screens/profile/info/my/main.dart';
import 'package:brandu/screens/profile/info/notice/main.dart';
import 'package:brandu/screens/profile/info/notify/main.dart';
import 'package:brandu/screens/profile/info/point/main.dart';
import 'package:brandu/screens/profile/info/service/main.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/icon-button.dart';
import 'package:brandu/widgets/profile/profile-box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: lightGreyColor,
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightGreyColor,
                ),
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MediumBoldText('하늘보리', Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: SmallText('로그아웃', greyColor),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconButton(() {}, 'assets/icons/heart-black.svg', '찜한상품', 1),
              iconButton(() {
                // Get.to(() => BucketPage());
              }, 'assets/icons/bucket-black.svg', '장바구니', 2),
              iconButton(() {}, 'assets/icons/save-black.svg', '스크랩북', 0),
              iconButton(() {
                Get.to(() => const CouponPage());
              }, 'assets/icons/coupon.svg', '쿠폰', 0),
              iconButton(() {
                Get.to(() => const ProfilePointPage());
              }, 'assets/icons/point.svg', '포인트', 0),
            ],
          ),
        ),
        Container(
          decoration: bottomBorder(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileBox(
                  () {
                    Get.to(() => const ProfileMyPage());
                  },
                  'assets/icons/profile-edit.svg',
                  '개인정보 수정',
                ),
                ProfileBox(
                  () {
                    Get.to(() => const NoticePage());
                  },
                  'assets/icons/announcement.svg',
                  '공지사항',
                ),
                ProfileBox(
                  () {
                    Get.to(() => const ServiceCenterPage());
                  },
                  'assets/icons/qna.svg',
                  '고객센터',
                ),
                ProfileBox(
                  () {
                    Get.to(() => const ProfileNotifyPage());
                  },
                  'assets/icons/alarm.svg',
                  '알림설정',
                ),
                ProfileBox(
                  () {},
                  '',
                  '서비스 이용 약관',
                ),
                ProfileBox(
                  () {},
                  '',
                  '개인정보처리방침',
                ),
                ProfileBox(
                  () {},
                  '',
                  '의견 보내기',
                ),
                ProfileBox(
                  () {},
                  '',
                  '버전',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
