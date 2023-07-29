import 'dart:async';
import 'package:cracktech/constants/colors.dart';
import 'package:cracktech/view/Movies/CustomWidgets/customText.dart';
import 'package:cracktech/view/Movies/HomeScreen/movieHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /*

  if (Preference.getLoggedInFlag()) {
      Future.delayed(
        const Duration(seconds: 2),
        () => Get.offAllNamed(MainScreen.routeName),
      );
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () => Get.offAllNamed(LoginScreen.routeName),
      );
    }
  */
  @override
  void initState() {
    super.initState();

    // if (Preference.getLoggedInFlag()) {
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(MovieHome.routeName);
      //  Get.offAllNamed(HomeScreen.routeName);
    });
/*    } else {
      Timer(const Duration(seconds: 2), () {
        //Get.offAllNamed(HomeScreen.routeName);
        Get.offAllNamed(LoginScreen.routeName);
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            color: ConstantColors.glassClr,
            child: Center(
              child: CustomText(
                textColor: Colors.white,
                text: "MovieOnline",
                textSize: 20,
                isBold: true,
              ),
            ),
          )),
    );
  }
}
