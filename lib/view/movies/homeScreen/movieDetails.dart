import 'package:cached_network_image/cached_network_image.dart';
import 'package:cracktech/constants/colors.dart';
import 'package:cracktech/states/model/movieListResponse.dart';
import 'package:cracktech/view/Movies/CustomWidgets/customText.dart';
import 'package:cracktech/view/Movies/CustomWidgets/helper.dart';
import 'package:cracktech/view/Movies/CustomWidgets/multi_colorText.dart';
import 'package:cracktech/view/Movies/HomeScreen/subView/movieCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieDetails extends StatefulWidget {
  Movie movieInfo;
  MovieDetails({required this.movieInfo, super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.65,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: widget.movieInfo.posterUrl ?? "",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => SizedBox(
                  width: Get.width * 0.25,
                  child: const Icon(Icons.image_not_supported)),
            ),
            // Image.network(
            //   widget.movieInfo.posterUrl ?? "",
            //   fit: BoxFit.cover,
            // ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 12),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset("assets/svg/back.png"),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 28.0, left: 18),
          //   child: Container(
          //     height: 35,
          //     width: 35,
          //     decoration: BoxDecoration(
          //       color: ConstantColors.glassClr,
          //       shape: BoxShape.circle,
          //     ),
          //     child: BackButton(
          //       color: Colors.white,
          //       onPressed: () {
          //         Get.back();
          //       },
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.60),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(
                  //   color: Colors.red,
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      children: [
                        for (var i = 0;
                            i < widget.movieInfo.genres.length;
                            i++) ...[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: MovieCategory(
                                isSelectedfromMain: false,
                                movieName: widget.movieInfo.genres[i]),
                          )
                        ],
                      ],
                    ),
                  ),
                  addH(12),
                  CustomText(
                      text: widget.movieInfo.title ?? "",
                      textSize: 25,
                      isBold: true),
                  addH(12),
                  MulticolorText(
                    firstText: "Year: ",
                    firstTextSize: 15,
                    secondText: widget.movieInfo.year ?? "",
                    firstTextColor: Colors.grey,
                    secondTextColor: Colors.black,
                    secondTextSize: 15,
                  ),
                  addH(12),
                  CustomText(text: "Director: ", textSize: 15, isBold: true),
                  CustomText(
                      text: widget.movieInfo.director ?? "", textSize: 15),
                  addH(12),
                  CustomText(text: "Actors: ", textSize: 15, isBold: true),
                  CustomText(text: widget.movieInfo.actors ?? "", textSize: 15),
                  addH(12),
                  CustomText(text: "Plot: ", textSize: 15, isBold: true),
                  CustomText(text: widget.movieInfo.plot ?? "", textSize: 15),
                  addH(50.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
