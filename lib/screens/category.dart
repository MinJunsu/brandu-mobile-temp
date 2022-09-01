import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/product.dart';
import 'package:brandu/widgets/header.dart';
import 'package:flutter/material.dart';

final tempCategories = [
  {
    "id": 1,
    "backdrop_image": "assets/images/category/cloth.png",
    "description": "자연으로 만든, 건강한 옷",
    "category": "의류"
  },
  {
    "id": 2,
    "backdrop_image": "assets/images/category/sport-water.png",
    "description": "플라스틱 사용을 줄이는",
    "category": "스포츠"
  },
  {
    "id": 3,
    "backdrop_image": "assets/images/category/phone.png",
    "description": "요즘 대세는 생분해성 케이스",
    "category": "테크"
  },
  {
    "id": 4,
    "backdrop_image": "assets/images/category/bag.png",
    "description": "동물을 보호하는 공존 패션",
    "category": "패션잡화"
  },
  {
    "id": 5,
    "backdrop_image": "assets/images/category/flower.png",
    "description": "집안 가득 좋은 느낌",
    "category": "홈데코/라방"
  },
  {
    "id": 6,
    "backdrop_image": "assets/images/category/sticker.png",
    "description": "건강하고 선명한 인쇄",
    "category": "스티커/지류"
  },
];

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<MainCategory> categories = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createHeader(
        isBack: true,
        title: '카테고리',
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            MainCategory category = categories[index];
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(category.backdrop_image!),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SmallText(category.name, greyColor),
                  SmallBoldText(category.name, Colors.black),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
