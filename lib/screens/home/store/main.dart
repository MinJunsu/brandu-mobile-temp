import 'package:brandu/models/product.dart';
import 'package:brandu/providers/products.dart';
import 'package:brandu/widgets/advertisement.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/home/main-box-sales.dart';
import 'package:brandu/widgets/home/main-navigator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late Future<List<SimpleProduct>> hotDeals;

  @override
  void initState() {
    super.initState();
    hotDeals = ProductClient().getHotDeals();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 220,
                      autoPlay: true,
                      viewportFraction: 1,
                    ),
                    items: [1, 2, 3, 4, 5].map(
                      (i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: getAdvertisment(
                                  'assets/images/carousel/img.png', i, 10),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const MainCategoryNavigator(),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<SimpleProduct>>(
                  future: hotDeals,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MainSaleBox(
                          title: '브랜뉴 오늘의 핫딜', products: snapshot.requireData);
                    }
                    return SizedBox(
                      height: 600,
                      child: indicator(),
                    );
                  },
                  initialData: const [],
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset('assets/images/event.png'),
                const SizedBox(
                  height: 20,
                ),
                // FutureBuilder<List<Product>>(builder: (context, snapshot) {
                //   if (snapshot.hasData) {
                //     return MainSaleBox(title: '6월의 베스트셀러', products: snapshot.requireData);
                //   }
                //   return indicator();
                // },initialData: [],),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
