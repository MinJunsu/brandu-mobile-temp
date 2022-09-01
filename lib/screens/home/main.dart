import 'package:brandu/components/color.dart';
import 'package:brandu/screens/home/bucket/main.dart';
import 'package:brandu/screens/home/community/main.dart';
import 'package:brandu/screens/home/store/main.dart';
import 'package:brandu/screens/home/wish/main.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/snackbar.dart';
import 'package:brandu/widgets/base/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
      ),
      body: DefaultTabController(
        length: 5,
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
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 2,
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
                    tabHead("스토어"),
                    tabHead("커뮤니티"),
                    tabHead("찜한상품"),
                    tabHead("장바구니"),
                    tabHead("스크랩북"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  StorePage(),
                  CommunityPage(),
                  WishPage(),
                  BucketPage(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('123')));
          // Get.to(() => const BucketPage());
        },
        backgroundColor: mainColor,
        child: SvgPicture.asset('assets/icons/bucket.svg'),
      ),
    );
  }
}
