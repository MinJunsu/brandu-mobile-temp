import 'package:brandu/components/color.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/icon-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShippingPage extends StatefulWidget {
  const ShippingPage({Key? key}) : super(key: key);

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage>
    with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '주문/배송 조회',
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TabBar(
                  controller: _controller,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: mainColor,
                  labelColor: mainColor,
                  unselectedLabelColor: greyColor,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 14,
                    height: 1.4,
                    letterSpacing: -0.5,
                    wordSpacing: -0.5,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 14,
                    height: 1.4,
                    letterSpacing: -0.5,
                    wordSpacing: -0.5,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                  tabs: <Widget>[
                    SizedBox(
                      height: 100,
                      child: Tab(
                        icon: SvgPicture.asset('assets/icons/bill.svg'),
                        text: '전체',
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Tab(
                        child: iconButton(
                          () {},
                          'assets/icons/bill.svg',
                          '전체',
                          1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  Container(),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
