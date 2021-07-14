import 'dart:convert';
import 'dart:io';

import 'package:flutter_base_app/networkLayer/ApiException.dart';
import "package:http/http.dart" as http;

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  Future<dynamic> fetchData(String endPoint,
      {Map<String, dynamic>? params}) async {
    var responseJson;
    var uri = endPoint + (params != null ? this.queryParams(params) : "");
    var header = {HttpHeaders.contentTypeHeader: "application/json"};

    try {
      final response = await http.get(Uri.https(uri,""), headers: header);
      responseJson = _responseData(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }

    return responseJson;
  }

  Future<dynamic> postData(String endPoint, dynamic body) async {
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: "application/json"};

    try {
      final response = await http.post(Uri.https(endPoint,""), body: body, headers: header);
      responseJson = _responseData(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }

    return responseJson;
  }

  Future<dynamic> putData(String endPoint, dynamic body) async {
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: "application/json"};

    try {
      final response = await http.put(Uri.https(endPoint,""), body: body, headers: header);
      responseJson = _responseData(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }

    return responseJson;
  }

  String queryParams(Map<String, dynamic> params) =>
      params != null ? "?${Uri(queryParameters: params)}" : "";

  dynamic _responseData(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error occurs while communication with server with Status code :${response.statusCode}");
    }
  }
}
