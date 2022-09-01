import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/screens/category.dart';
import 'package:brandu/screens/profile/main.dart';
import 'package:brandu/screens/search/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

AppBar createHeader({isBack = false, isSearch = true, title = ''}) {
  return AppBar(
    leading: isBack
        ? IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset('assets/icons/back.svg'),
          )
        : IconButton(
            onPressed: () {
              Get.off(() => CategoryPage());
            },
            icon: SvgPicture.asset('assets/icons/menu.svg'),
          ),
    backgroundColor: mainColor,
    centerTitle: true,
    title: title == ''
        ? SvgPicture.asset(
            'assets/icons/logo.svg',
            fit: BoxFit.fitHeight,
            height: 20,
          )
        : LargeBoldText.withoutColor(title),
    actions: isSearch
        ? [
            IconButton(
                onPressed: () {
                  Get.to(() => const SearchPage());
                },
                icon: SvgPicture.asset('assets/icons/search.svg')),
            IconButton(
                onPressed: () {
                  Get.to(() => const ProfilePage());
                },
                icon: SvgPicture.asset('assets/icons/info.svg')),
          ]
        : [
            IconButton(
                onPressed: () {
                  Get.to(() => const ProfilePage());
                },
                icon: SvgPicture.asset('assets/icons/info.svg'))
          ],
    elevation: 0,
  );
}
