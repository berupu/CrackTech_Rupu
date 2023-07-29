import 'package:cracktech/states/model/movieListResponse.dart';
import 'package:cracktech/states/services/movieServices.dart';
import 'package:get/get.dart';
import 'dart:convert';

class MovieController extends GetxController {
  RxBool getMovieListLoadingFlag = true.obs;
  MovieListResponse? movieListResponse;

  List<Movie> allMovie = [];

  void getMovieList() async {
    getMovieListLoadingFlag.value = true;
    try {
      var response = await MovieServices.getMovieList();

      //movieListResponse = movieListResponseFromJson(jsonEncode(response));

      final Map parsedToMap = json.decode(response);
      movieListResponse = MovieListResponse.fromJson(parsedToMap);
    } finally {
      if (movieListResponse != null) {
        allMovie = movieListResponse!.movies;
      }
      getMovieListLoadingFlag.value = false;
    }
  }
}
