import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/providers/accounts.dart';
import 'package:brandu/utilities/formater.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:brandu/widgets/base/check-box.dart';
import 'package:brandu/widgets/base/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BucketBox extends StatefulWidget {
  final Bucket bucket;
  final bool checked;
  final dynamic setChecked;
  final int count;
  final Function() add;
  final Function() sub;
  const BucketBox({
    Key? key,
    required this.bucket,
    required this.checked,
    required this.setChecked,
    required this.count,
    required this.add,
    required this.sub,
  }) : super(key: key);

  @override
  State<BucketBox> createState() => _BucketBoxState();
}

class _BucketBoxState extends State<BucketBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bottomBorder(),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.bucket.product.backdrop_image!),
                ),
              ),
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(0),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: circleCheckBox(
                    widget.checked,
                    widget.setChecked,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 100,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(widget.bucket.product.name, greyColor),
                      Row(
                        children: [
                          SmallBoldText(
                            currencyFormat.format(widget.bucket.product.price),
                            Colors.black,
                          ),
                          SmallText(' 원', Colors.black),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Counter(
                    count: widget.count,
                    add: widget.add,
                    sub: widget.sub,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      bool flag =
                          await AccountsClient().deleteBucket(widget.bucket.id);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/close.svg',
                    ),
                  ),
                  const Spacer(),
                  SmallText(
                    '${currencyFormat.format(widget.bucket.product.price * widget.count)} 원',
                    greyColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
