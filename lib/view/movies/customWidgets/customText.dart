import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';

class CustomText extends StatelessWidget {
  String text;
  double textSize;
  Color? textColor;
  bool? isBold;
  TextDecoration? textDecoration;

  CustomText(
      {required this.text,
      required this.textSize,
      this.textColor,
      this.isBold,
      this.textDecoration,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: textDecoration,
        fontSize: textSize,
        color: textColor ?? Colors.black,
        fontWeight: (isBold != null) ? FontWeight.bold : FontWeight.normal,
        fontFamily: ConstantStrings.kAppFont,
      ),
    );
  }
}
