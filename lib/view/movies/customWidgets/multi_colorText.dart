import 'package:flutter/material.dart';

import '../../../constants/strings.dart';

class MulticolorText extends StatelessWidget {
  String firstText;
  Color? firstTextColor;
  double? firstTextSize;
  FontWeight? firstTextWeight;

  String secondText;
  Color? secondTextColor;
  double? secondTextSize;
  FontWeight? secondTextWeight;

  MulticolorText(
      {required this.firstText,
      this.firstTextColor,
      this.firstTextSize,
      this.firstTextWeight,
      required this.secondText,
      this.secondTextColor,
      this.secondTextSize,
      this.secondTextWeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: firstText,
              style: TextStyle(
                color: firstTextColor ?? Colors.black,
                fontSize: firstTextSize ?? 10,
                fontWeight: firstTextWeight ?? FontWeight.normal,
                // fontFamily: ConstantStrings.kFontFamily
              )),
          TextSpan(
              text: secondText,
              style: TextStyle(
                color: secondTextColor ?? Colors.black,
                fontSize: secondTextSize ?? 10,
                fontWeight: secondTextWeight ?? FontWeight.normal,
                fontFamily: ConstantStrings.kAppFont,
              )),
        ],
      ),
    );
  }
}
