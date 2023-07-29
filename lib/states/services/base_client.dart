import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cracktech/constants/service_constants.dart';
import 'package:dio/dio.dart';

class BaseClient {
  static const int TIME_OUT_DURATION = 20;

  static Future<dynamic> getData({
    required String api,
    dynamic parameter,
  }) async {
    String url = ServiceConstants.kBaseUrl + api;
    print('Sending request to: $url');
    try {
      var response = await Dio().get(
        ServiceConstants.kBaseUrl + api,
        queryParameters: parameter,
      );
      print('GET Method: ${response.statusCode}');
      print(url);
      // log("GET Response:  ${response.data}");
      //log("GET Response: ${jsonEncode(response.data)}");
      log("GET Response: ${response.data}");

      return response.data;
    } catch (e) {
      print("Error: $e");
    }
  }

  static Future<dynamic> postData({
    required String api,
    required dynamic body,
  }) async {
    String url = ServiceConstants.kBaseUrl + api;
    print('Sending request to: $url');
    log("Post Body: ${jsonEncode(body)}");
    //can we print in json format here?
    try {
      var response = await Dio().post(
        ServiceConstants.kBaseUrl + api,
        data: body,
      );
      print('POST Method: ${response.statusCode}');
      print(url);
      log("POST Response:  ${response.data.toString()}");
      return response.data;
    } catch (e) {
      print("Error: $e");
    }
  }
}
