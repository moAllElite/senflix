import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senflix/api_key/api_key.dart';
import 'package:senflix/models/movie_model.dart';
import 'package:senflix/utils/param_api.dart';

Future<MovieModel?> fetchMovieData(String urlLink) async{

  var url =
  Uri.tryParse(urlLink);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url!,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader :'application/json',
      HttpHeaders.authorizationHeader: bearer,
    }
  );
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return  MovieModel.fromJson(jsonResponse);
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
    return null;
  }
}


Future<MovieModel?> getDiscoveryTv() async{
  var url =
  Uri.tryParse(discoveryForTv);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url!);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return  MovieModel.fromJson(jsonResponse);

  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
    return null;
  }
}