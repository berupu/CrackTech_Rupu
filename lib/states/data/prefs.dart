import 'dart:convert';
import 'package:cracktech/states/model/movieListResponse.dart';
import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const userDetails = 'movieAll';

  // get
  static MovieListResponse getUserDetails() {
    var result = prefs.read(userDetails);
    return MovieListResponse.fromJson(json.decode(result));
  }

  // set
  static void setUserDetails(MovieListResponse value) {
    prefs.write(userDetails, json.encode(value));
  }
}
