import 'dart:convert' as convert;
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senflix/api_key/api_key.dart';
import 'package:senflix/models/movie_model.dart';
import 'package:senflix/utils/param_api.dart';

Future<MovieModel?> searchMovieByName() async {
 // var url =  Uri.https(searchQuery);
  var url = Uri.tryParse(searchQuery);
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url!);
  if (response.statusCode == 200) {
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
     //print(itemCount);
    MovieModel.fromJson(jsonResponse).results.forEach((element) {
      print(element.title);
    });
    return MovieModel.fromJson(jsonResponse);
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
    return null;
  }
}

Future<MovieModel?> upcommingMovies() async {
  var url = Uri.tryParse(upcoming);
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url!,
    headers: {
      HttpHeaders.authorizationHeader: bearer,
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader :'application/json',

    },
  );
  if (response.statusCode == 200) {
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
    MovieModel data = await Isolate.run<MovieModel>(() {
      return MovieModel.fromJson(jsonResponse);
    });

   return data;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }

}