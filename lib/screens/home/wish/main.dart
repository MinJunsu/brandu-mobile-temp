import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/utilities/formater.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WishPage extends StatefulWidget {
  const WishPage({Key? key}) : super(key: key);

  @override
  State<WishPage> createState() => _WishPageState();
}

class _WishPageState extends State<WishPage> {
  late Future<List<Bucket>> favorites;

  @override
  void initState() {
    super.initState();
    favorites = AccountsClient().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Bucket>>(
      future: favorites,
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: snapshot.requireData.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Bucket bucket = snapshot.requireData[index];
                            return Container(
                              decoration: bottomBorder(),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(bucket
                                                  .product.backdrop_image!),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SmallText(
                                                bucket.product.name, greyColor),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SmallBoldText(
                                              '${currencyFormat.format(bucket.product.price)}원',
                                              Colors.black,
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            bool flag = await AccountsClient()
                                                .deleteBucket(bucket.id);
                                          },
                                          icon: SvgPicture.asset(
                                            'assets/icons/close.svg',
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: lightGreyColor,
                                          ),
                                          width: 30,
                                          height: 30,
                                          child: IconButton(
                                            onPressed: () async {
                                              bool flag = await AccountsClient()
                                                  .patchFavorite(bucket.id);
                                            },
                                            icon: SvgPicture.asset(
                                              'assets/icons/bucket.svg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.requireData.length,
                        )
                      : Container(
                          width: double.infinity,
                          decoration: bottomBorder(),
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 40,
                            ),
                            child: SmallText('내역이 존재하지 않습니다.', mainColor),
                          ),
                        ),
                ),
              ),
            ],
          );
        }
        return indicator();
      },
    );
  }
}
