import 'package:brandu/models/product.dart';
import 'package:brandu/widgets/home/main-box-sales.dart';
import 'package:flutter/material.dart';

Widget searchResultBox(List<Product> products) {
  return Expanded(
    child: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            Product product = products[index];
            return MainBox(
              id: product.id,
              backdropImage: product.backdrop_image,
              title: product.name,
              price: product.price,
              isWished: true,
            );
          },
        ),
      ),
    ),
  );
}
