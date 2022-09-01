import 'package:brandu/components/color.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final bool initialValue;
  final dynamic onChanged;
  const ToggleButton({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool flag = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    if (!flag) {
      isActive = widget.initialValue;
      flag = true;
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive ? mainColor : greyColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
        color: isActive ? lightMainColor : lightGreyColor,
      ),
      width: 56,
      height: 30,
      child: Transform.scale(
        scale: 1.2,
        child: Switch(
          inactiveTrackColor: Colors.transparent,
          activeTrackColor: Colors.transparent,
          inactiveThumbColor: greyColor,
          activeColor: mainColor,
          value: isActive,
          onChanged: (value) {
            setState(() {
              isActive = value;
              widget.onChanged();
            });
          },
        ),
      ),
    );
  }
}
