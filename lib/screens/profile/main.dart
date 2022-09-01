import 'package:brandu/components/color.dart';
import 'package:brandu/screens/profile/info/main.dart';
import 'package:brandu/screens/profile/order/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/tabbar.dart';
import 'package:brandu/widgets/header-icon.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
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
        leading: homeIcon(),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
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
                    tabHead("마이페이지"),
                    tabHead("주문/배송"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: const [
                  ProfileInfoPage(),
                  ProfileOrderPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
