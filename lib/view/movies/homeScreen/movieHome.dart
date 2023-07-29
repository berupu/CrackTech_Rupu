import 'dart:io';
import 'package:cracktech/states/controller/movieController.dart';
import 'package:cracktech/states/model/movieListResponse.dart';
import 'package:cracktech/view/Movies/CustomWidgets/customText.dart';
import 'package:cracktech/view/Movies/CustomWidgets/helper.dart';
import 'package:cracktech/view/Movies/CustomWidgets/topBar.dart';
import 'package:cracktech/view/Movies/HomeScreen/subView/movieBoard.dart';
import 'package:cracktech/view/Movies/HomeScreen/subView/movieCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieHome extends StatefulWidget {
  static String routeName = '/movie_Home';

  const MovieHome({Key? key}) : super(key: key);

  @override
  State<MovieHome> createState() => _MovieHomeNewState();
}

class _MovieHomeNewState extends State<MovieHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController = ScrollController();
  final MovieController _movieCon = Get.find<MovieController>();

  int selectedCategoryIndex = -1;
  String selectedCategory = "";

  List<Movie> filteredMovie = [];

  void filterbyCategory(searchString) {
    filteredMovie = _movieCon.movieListResponse!.movies
        .where((element) => element.genres.contains(searchString))
        .toList();

    print(filteredMovie.length);
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        _movieCon.getMovieList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TopBar(
          title: 'MovieOnline',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() {
                if (_movieCon.getMovieListLoadingFlag.value) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 300.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  );
                } else {
                  //filterbyCategory(_movieCon.movieListResponse!.genres.first);

                  return SizedBox(
                    height: 150,
                    width: Get.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _movieCon.movieListResponse!.genres.length,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(bottom: 80),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: InkWell(
                            onTap: () {
                              filterbyCategory(
                                  _movieCon.movieListResponse!.genres.first);

                              scrollController.animateTo(
                                index * 90,
                                duration: const Duration(seconds: 1),
                                curve: Curves.decelerate,
                              );
                              setState(() {
                                selectedCategoryIndex = index;
                                selectedCategory =
                                    _movieCon.movieListResponse!.genres[index];

                                filterbyCategory(selectedCategory);
                              });
                            },
                            child: MovieCategory(
                                isSelectedfromMain:
                                    (selectedCategoryIndex == index)
                                        ? true
                                        : false,
                                movieName:
                                    _movieCon.movieListResponse!.genres[index]),
                          ),
                        );
                      },
                    ),
                  );
                }
                // }
              }),
              addH(10.h),
              CustomText(
                  text: "${filteredMovie.length} $selectedCategory Movies",
                  textSize: 12),
              addH(10.h),
              SizedBox(
                height: 800,
                width: Get.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  //itemCount: _movieCon.movieListResponse?.movies.length ?? 0,
                  itemCount: filteredMovie.length,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(bottom: 80),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12),
                      child: MovieBoard(movieInfo: filteredMovie[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
