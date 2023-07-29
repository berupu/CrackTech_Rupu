import 'dart:convert';

import 'package:cracktech/constants/service_constants.dart';
import 'package:cracktech/states/services/base_client.dart';

class MovieServices {
  // Banner Function
  static Future<dynamic> getMovieList() async {
    var response = await BaseClient.getData(api: ServiceConstants.kMovieList);
    return response;
  }
}
