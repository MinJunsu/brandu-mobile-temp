import 'package:brandu/components/color.dart';
import 'package:brandu/models/product.dart';
import 'package:brandu/providers/products.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:flutter/material.dart';

class MainCategoryNavigator extends StatefulWidget {
  const MainCategoryNavigator({Key? key}) : super(key: key);

  @override
  State<MainCategoryNavigator> createState() => _MainCategoryNavigatorState();
}

class _MainCategoryNavigatorState extends State<MainCategoryNavigator> {
  late Future<List<MainCategory>> categories;

  @override
  void initState() {
    super.initState();
    categories = ProductClient().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MainCategory>>(future: categories,
      builder: (context, snapshot) {
      if (snapshot.hasData) {
        return boxContainer(
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 15,
                children: [
                  getLabelButton(
                        () {},
                    'assets/icons/recommend.svg',
                    '추천상품',
                    mainColor,
                  ),
                  getLabelButton(
                        () {},
                    'assets/icons/star.svg',
                    '인기상품',
                    const Color.fromRGBO(236, 175, 73, 1.0),
                  ),
                  ...snapshot.requireData.map((category) => getLabelButton(() {}, 'assets/icons/star.svg' , category.name, Color(int.parse('0xff${category.color}'))))
                ],
              ),
            ),
          ),
          100,
          Colors.white,
        );
      }
      return indicator();
    },
      initialData: [],
    );
  }
}
