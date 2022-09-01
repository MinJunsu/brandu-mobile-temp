import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/product.dart';
import 'package:brandu/widgets/base/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainSaleBox extends StatelessWidget {
  final String title;
  final List<SimpleProduct> products;

  const MainSaleBox({Key? key, required this.title, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return boxContainer(
      Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LargeBoldText(title, Colors.black),
                XSmallText('전체보기', lightGreyColor),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                children: products
                    .sublist(0, products.length ~/ 2)
                    .map(
                      (product) => MainBox(
                        id: product.id,
                        backdropImage: product.backdrop_image,
                        title: product.name,
                        price: product.price,
                        isWished: product.is_wish,
                      ),
                    )
                    .toList(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                children: products
                    .sublist(products.length ~/ 2, products.length)
                    .map(
                      (product) => MainBox(
                        id: product.id,
                        backdropImage: product.backdrop_image,
                        title: product.name,
                        price: product.price,
                        isWished: product.is_wish,
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
      610,
      Colors.white,
    );
  }
}

class MainBox extends StatelessWidget {
  final int id;
  final String? backdropImage;
  final String title;
  final int price;
  final bool isWished;

  const MainBox({
    Key? key,
    required this.id,
    this.backdropImage,
    required this.title,
    required this.price,
    required this.isWished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isWished);
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 156,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(backdropImage ??
                    'https://brandu-bucket.s3.ap-northeast-2.amazonaws.com/media/product/2022-08/img.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA552APCMTG7QIRJOW%2F20220831%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20220831T072115Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=f02d47fdc447bdb124324af8b741e7c630b321440045c07763fd1c10a89cd9ed'),
              ),
            ),
            child: Container(
              width: 10,
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.all(10),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isWished
                        ? mainColor
                        : const Color.fromRGBO(217, 217, 217, 0.8)),
                child: SvgPicture.asset(
                  'assets/icons/heart.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(title, greyColor),
                const SizedBox(
                  height: 3,
                ),
                SmallBoldText('$price원', Colors.black),
              ],
            ),
          )
        ],
      ),
    );
  }
}
