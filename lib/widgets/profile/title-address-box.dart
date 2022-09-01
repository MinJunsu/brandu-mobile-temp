import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:brandu/models/account.dart';
import 'package:brandu/widgets/base/indicator.dart';
import 'package:brandu/widgets/base/small-button-box.dart';
import 'package:flutter/material.dart';

class BadgeAddressBox extends StatefulWidget {
  final List<Address> addresses;
  final int index;
  final dynamic onPressed;
  const BadgeAddressBox({
    Key? key,
    required this.addresses,
    required this.index,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<BadgeAddressBox> createState() => _BadgeAddressBoxState();
}

class _BadgeAddressBoxState extends State<BadgeAddressBox> {
  @override
  Widget build(BuildContext context) {
    if (widget.addresses.isEmpty) {
      return SizedBox(
        height: 150,
        child: indicator(),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: lightGreyColor,
            width: 1,
          ),
        ),
      ),
      child: Wrap(
        runSpacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText('배송정보', Colors.black),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 5,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      ...widget.addresses
                          .asMap()
                          .map(
                            (idx, address) => MapEntry(
                              idx,
                              addressBadge(
                                idx == widget.index,
                                address.name,
                                () => widget.onPressed(idx),
                              ),
                            ),
                          )
                          .values
                          .toList()
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 70,
                height: 30,
                child: SmallButtonBox(title: '수정하기', onPressed: () {}),
              )
            ],
          ),
          Row(
            children: [
              SmallText('수령인', greyColor),
              const SizedBox(
                width: 20,
              ),
              SmallText(widget.addresses[widget.index].recipient, Colors.black),
            ],
          ),
          Row(
            children: [
              SmallText('연락처', greyColor),
              const SizedBox(
                width: 20,
              ),
              SmallText(
                  widget.addresses[widget.index].phone_number, Colors.black),
            ],
          ),
          Row(
            children: [
              SmallText('주소', greyColor),
              const SizedBox(
                width: 33,
              ),
              Flexible(
                child: SmallText(
                    widget.addresses[widget.index].address, Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget addressBadge(bool isPicked, String name, onClick) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPicked ? mainColor : Colors.transparent,
          border: Border.all(
            color: mainColor,
            width: 1,
          )),
      child: XSmallText(name, isPicked ? Colors.white : mainColor),
    ),
  );
}
