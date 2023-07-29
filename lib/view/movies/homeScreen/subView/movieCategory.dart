import 'package:cracktech/constants/colors.dart';
import 'package:cracktech/view/Movies/CustomWidgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class MovieCategory extends StatefulWidget {
  String movieName;
  //VoidCallback onTap;
  bool isSelectedfromMain;

  MovieCategory(
      {required this.isSelectedfromMain,
      required this.movieName,
      //required this.onTap,
      super.key});

  @override
  State<MovieCategory> createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory> {
  // bool isSelected = false;

  // @override
  // void initState() {
  //   isSelected = widget.isSelectedfromMain;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isSelectedfromMain ? Colors.black : Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        // boxShadow: const [
        //   BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, -2)),
        // ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: widget.movieName,
            textSize: 15,
            textColor: widget.isSelectedfromMain
                ? Colors.white
                : ConstantColors.glassClr,
          ),
        ),
      ),
    );
  }
}
