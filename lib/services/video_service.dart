
import 'package:senflix/models/video_model.dart';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senflix/api_key/api_key.dart';
Future<VideoModel?> fetchVideoData(int movieId) async{

  var url =
  Uri.tryParse('https://api.themoviedb.org/3/movie/$movieId/videos?languages=fr-FR');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
      url!,
      headers: {
        HttpHeaders.authorizationHeader: bearer,
      }
  );
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return  VideoModel.fromJson(jsonResponse);
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
    return null;
  }
}



Future<String?> fetchVideoKey(int movieId) async{

  var url =
  Uri.tryParse('https://api.themoviedb.org/3/movie/$movieId/videos?languages=fr-FR');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
      url!,
      headers: {
        HttpHeaders.authorizationHeader: bearer,
      }
  );
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    for (var element in VideoModel.fromJson(jsonResponse).results) {
      print(element.key);
    }
    return  VideoModel.fromJson(jsonResponse).results.first.key;
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
