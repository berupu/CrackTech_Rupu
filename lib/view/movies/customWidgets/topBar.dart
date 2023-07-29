import 'package:cracktech/constants/colors.dart';
import 'package:cracktech/view/Movies/CustomWidgets/customText.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final String title;
  final String? image;

  TopBar({required this.title, this.image, super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 5.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Image.asset("assets/images/menu.png"),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child:
                  CustomText(text: widget.title, textSize: 20, isBold: true)),
          const CircleAvatar(
            //radius: 20,
            backgroundImage: AssetImage("assets/svg/me.png"),
          )
        ],
      ),
    );
  }
}
