import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/screens/profile/order/review/create.dart';
import 'package:brandu/utilities/formater.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/button-box.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/base/main-button-box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  bool isWriteable = true;
  bool isWrote = false;
  late List<bool> isSelected;
  late Future<List<Review>> reviews;

  @override
  void initState() {
    super.initState();
    isSelected = [isWriteable, isWrote];
    reviews = AccountsClient().getReviews();
  }

  void toggleSelect(value) {
    if (value == 0) {
      isWriteable = true;
      isWrote = false;
    } else {
      isWriteable = false;
      isWrote = true;
    }
    setState(() {
      isSelected = [isWriteable, isWrote];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: '리뷰 관리',
        actions: const <Widget>[],
      ),
      body: FutureBuilder<List<Review>>(
        future: reviews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Review> writeable = snapshot.requireData
                .where((element) => element.is_write == false)
                .toList();
            List<Review> wrote = snapshot.requireData
                .where((element) => element.is_write == true)
                .toList();
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: ToggleButtons(
                      constraints: BoxConstraints(
                        minWidth: (MediaQuery.of(context).size.width - 30) / 2,
                        maxWidth: (MediaQuery.of(context).size.width - 30) / 2,
                        minHeight: 40,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      fillColor: mainColor,
                      borderColor: mainColor,
                      selectedBorderColor: mainColor,
                      onPressed: toggleSelect,
                      isSelected: isSelected,
                      children: [
                        SmallBoldText(
                          '작성가능한 리뷰 (${writeable.length})',
                          isWriteable ? Colors.white : mainColor,
                        ),
                        SmallBoldText(
                          '작성한 리뷰 (${wrote.length})',
                          isWrote ? Colors.white : mainColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        List<Review> reviews = isWriteable ? writeable : wrote;
                        Review review = reviews[index];
                        return Container(
                          decoration: bottomBorder(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      color: lightGreyColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                            review.product_name, Colors.black),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SmallText(
                                          '구매일: ${baseDateFormat.format(review.payment_day)}',
                                          greyColor,
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => ReviewCreatePage(
                                                review: review));
                                          },
                                          child: RatingBar.builder(
                                            glow: false,
                                            itemSize: 20,
                                            initialRating:
                                                review.star.toDouble() / 2,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            ignoreGestures: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 75,
                                  height: 35,
                                  child: isWriteable
                                      ? MainButtonBox('리뷰쓰기', () {
                                          Get.to(() =>
                                              ReviewCreatePage(review: review));
                                        })
                                      : ButtonBox('리뷰 수정', () {
                                          Get.to(() =>
                                              ReviewCreatePage(review: review));
                                        }),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: isWriteable ? writeable.length : wrote.length,
                    ),
                  ),
                ),
              ],
            );
          }
          return SizedBox(
            height: 500,
            child: indicator(),
          );
        },
      ),
    );
  }
}
