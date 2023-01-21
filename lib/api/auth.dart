import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/api_model.dart';

class Authenticaiton {
  Future<List<Welcome>?> fetchProduct() async {
    var urls = Uri.https('makeup-api.herokuapp.com', '/api/v1/products.json',
        {'brand': 'maybelline'});
    //  var uri = Uri.http('example.org', '/path', {'q': 'dart'});
    //  print(uri); // http://example.org/path?q=dart
    var response = await http.get(urls);
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      // var jsonResponse = response.body;
      print(jsonResponse);

      //  return welcomeFromJson(jsonResponse);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
