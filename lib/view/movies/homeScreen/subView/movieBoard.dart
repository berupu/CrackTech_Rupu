import 'package:cached_network_image/cached_network_image.dart';
import 'package:cracktech/states/model/movieListResponse.dart';
import 'package:cracktech/view/Movies/CustomWidgets/customText.dart';
import 'package:cracktech/view/Movies/CustomWidgets/helper.dart';
import 'package:cracktech/view/Movies/CustomWidgets/multi_colorText.dart';
import 'package:cracktech/view/Movies/HomeScreen/movieDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MovieBoard extends StatefulWidget {
  Movie movieInfo;
  MovieBoard({required this.movieInfo, super.key});

  @override
  State<MovieBoard> createState() => _MovieBoardState();
}

class _MovieBoardState extends State<MovieBoard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MovieDetails(movieInfo: widget.movieInfo));
      },
      child: Container(
        height: Get.height * 0.17,
        width: Get.width,
        decoration: BoxDecoration(
          //color: Colors.black,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          // boxShadow: const [
          //   BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(0, -2)),
          // ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: widget.movieInfo.posterUrl ?? "",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => SizedBox(
                      width: Get.width * 0.25,
                      child: Icon(Icons.image_not_supported)),
                ),
                //     Image.network(
                //   widget.movieInfo.posterUrl ?? "",
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            addW(20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: widget.movieInfo.title ?? "Not Found",
                      textSize: 20,
                      isBold: true),
                  addH(10),
                  MulticolorText(
                    firstText: "Year: ",
                    firstTextSize: 12,
                    secondText: widget.movieInfo.year ?? "",
                    firstTextColor: Colors.grey,
                    secondTextColor: Colors.black,
                    secondTextSize: 12,
                  ),
                  addH(10),
                  CustomText(
                    text: "Director:",
                    textSize: 12,
                    textColor: Colors.grey,
                  ),
                  //addH(10),
                  CustomText(
                      text: widget.movieInfo.director ?? "Not Found",
                      textSize: 15),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
