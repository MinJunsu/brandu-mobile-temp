import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  final String title;
  final String initialValue;
  final dynamic onSaved;
  final dynamic validator;
  const InputBox(this.title, this.onSaved, this.initialValue,
      {this.validator, Key? key})
      : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    dynamic onSaved = widget.onSaved;
    dynamic validator = widget.validator;
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: SmallText(widget.title, greyColor),
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 250,
          height: 30,
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
            initialValue: widget.initialValue,
            autovalidateMode: AutovalidateMode.always,
            onSaved: onSaved,
            validator: validator,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
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
            keyboardType: TextInputType.text,
          ),
        )
      ],
    );
  }
}
