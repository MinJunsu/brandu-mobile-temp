import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/event.dart';
import 'package:brandu/providers/events.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:flutter/material.dart';

class CouponRegisterPage extends StatefulWidget {
  const CouponRegisterPage({Key? key}) : super(key: key);

  @override
  State<CouponRegisterPage> createState() => _CouponRegisterPageState();
}

class _CouponRegisterPageState extends State<CouponRegisterPage> {
  final _controller = TextEditingController();
  String keyword = '';

  @override
  void initState() {
    super.initState();

    _controller.addListener(setCouponNumber);
  }

  void setCouponNumber() {
    setState(() {
      keyword = _controller.text;
    });
  }

  void registerCoupon(String couponNumber) async {
    EventClient client = EventClient();
    CouponHold coupon = await client.postCoupon(couponNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        actions: const <Widget>[],
        title: '쿠폰등록',
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
              child: TextField(
                cursorHeight: 0,
                cursorWidth: 0,
                cursorColor: mainColor,
                controller: _controller,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: '쿠폰 번호를 입력해주세요.',
                  hintStyle: TextStyle(
                    color: greyColor,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(width: 1, color: lightGreyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(width: 1, color: lightGreyColor),
                  ),
                ),
                keyboardType: TextInputType.text,
                onSubmitted: registerCoupon,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SmallText('이미 사용되었거나, 잘못된 쿠폰 번호 입니다.', Colors.red),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mainColor,
              ),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: SmallBoldText.withoutColor('쿠폰 등록'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
