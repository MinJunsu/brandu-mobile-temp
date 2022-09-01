import 'package:flutter/material.dart';

// class BaseText extends Text {
//   const BaseText(String text) : super(text);
//
//   @override
//   TextStyle? get style => const TextStyle(
//     fontFamily: 'Noto Sans KR',
//     color: Colors.white,
//     wordSpacing: -0.05,
//     decoration: TextDecoration.none,
//   );
// }

class XSmallBoldText extends Text {
  Color color;
  XSmallBoldText(String text, this.color, {Key? key}) : super(key: key, text);
  XSmallBoldText.withoutColor(String text, {Key? key})
      : this(text, Colors.white);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        color: color,
        fontSize: 12,
        height: 1.4,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      );
}

class XSmallText extends Text {
  Color color;
  XSmallText(String text, this.color, {Key? key}) : super(key: key, text);
  XSmallText.withoutColor(String text, {Key? key}) : this(text, Colors.white);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        color: color,
        fontSize: 12,
        height: 1.4,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      );
}

class SmallText extends Text {
  Color color;
  SmallText(String text, this.color, {Key? key}) : super(key: key, text);
  SmallText.withoutColor(String text, {Key? key}) : this(text, Colors.white);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        color: color,
        fontSize: 14,
        height: 1.4,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      );
}

class SmallBoldText extends Text {
  Color color;
  SmallBoldText(String text, this.color, {Key? key}) : super(key: key, text);
  SmallBoldText.withoutColor(String text, {Key? key})
      : this(text, Colors.white);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        color: color,
        fontSize: 14,
        height: 1.4,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      );
}

class MediumText extends Text {
  Color color;
  MediumText(String text, this.color, {Key? key}) : super(key: key, text);
  MediumText.withoutColor(String text, {Key? key}) : this(text, Colors.white);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        color: color,
        fontSize: 16,
        height: 1.4,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      );
}

class MediumBoldText extends Text {
  Color color;
  MediumBoldText(String text, this.color, {Key? key}) : super(key: key, text);
  MediumBoldText.withoutColor(String text, {Key? key})
      : this(text, Colors.white);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        color: color,
        fontSize: 16,
        height: 1.4,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      );
}

class LargeText extends Text {
  Color color;
  LargeText(String text, this.color, {Key? key}) : super(key: key, text);
  LargeText.withoutColor(String text, {Key? key}) : this(text, Colors.white);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        fontSize: 16,
        height: 1.4,
        color: color,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      );
}

class LargeBoldText extends Text {
  Color color;
  LargeBoldText(String text, this.color, {Key? key}) : super(key: key, text);
  LargeBoldText.withoutColor(String text, {Key? key})
      : this(text, Colors.white);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        color: color,
        fontSize: 18,
        height: 1.4,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      );
}

class XLargeText extends Text {
  Color color;
  XLargeText(String text, this.color, {Key? key}) : super(key: key, text);
  XLargeText.withoutColor(String text, {Key? key}) : this(text, Colors.white);

  @override
  TextStyle? get style => TextStyle(
        fontFamily: 'Noto Sans KR',
        color: color,
        fontSize: 26,
        height: 1.4,
        letterSpacing: -0.5,
        wordSpacing: -0.5,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none,
      );
}
