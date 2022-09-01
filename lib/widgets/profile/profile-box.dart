import 'package:brandu/components/text.dart';
import 'package:brandu/widgets/base/border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBox extends StatelessWidget {
  final dynamic onPressed;
  final String icon;
  final String name;
  const ProfileBox(this.onPressed, this.icon, this.name, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: bottomBorder(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: icon != ''
                    ? [
                        SvgPicture.asset(
                          icon,
                          fit: BoxFit.fitHeight,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MediumText(name, Colors.black),
                      ]
                    : [
                        MediumText(name, Colors.black),
                      ],
              ),
              SvgPicture.asset(
                'assets/icons/right-arrow.svg',
                fit: BoxFit.fitHeight,
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
