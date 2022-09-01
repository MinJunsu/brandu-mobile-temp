import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/utilities/formater.dart';
import 'package:brandu/widgets/appbar.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCreatePage extends StatefulWidget {
  final Review review;
  const ReviewCreatePage({Key? key, required this.review}) : super(key: key);

  @override
  State<ReviewCreatePage> createState() => _ReviewCreatePageState();
}

class _ReviewCreatePageState extends State<ReviewCreatePage> {
  final _formKey = GlobalKey<FormState>();
  double _star = 0;
  String _description = '';

  @override
  Widget build(BuildContext context) {
    Review review = widget.review;
    if (review.is_write) {
      _star = review.star.toDouble() / 2;
      _description = review.description;
    }

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isBack: true,
        title: review.is_write ? '리뷰 수정' : '리뷰쓰기',
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // 서버에 요청
              }
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              alignment: Alignment.center,
              child: MediumBoldText.withoutColor('저장'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: bottomBorder(),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(review.product_name, Colors.black),
                      const SizedBox(
                        height: 5,
                      ),
                      SmallText(
                        '구매일: ${baseDateFormat.format(review.payment_day)}',
                        greyColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: RatingBar.builder(
              itemSize: 35,
              initialRating: _star,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _star = rating;
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            height: 175,
            child: TextFormField(
              style: const TextStyle(
                fontFamily: 'Noto Sans KR',
                fontSize: 14,
                height: 1.4,
                letterSpacing: -0.5,
                wordSpacing: -0.5,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
              maxLines: 10,
              initialValue: _description,
              decoration: const InputDecoration(
                hintText: '상세 리뷰를 작성해주세요',
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(width: 1, color: lightGreyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(width: 1, color: lightGreyColor),
                ),
              ),
              keyboardType: TextInputType.multiline,
              onSaved: (value) {
                setState(() {
                  _description = value as String;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
