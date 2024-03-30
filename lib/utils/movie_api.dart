import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:senflix/api_key/api_key.dart';
import 'package:senflix/models/movie_result.dart';
import 'package:senflix/models/result.model.dart';
import 'package:senflix/utils/constant.dart';


Future<MovieResult?> searchMovieByName() async {
 // var url =  Uri.https(searchQuery);
  var url = Uri.tryParse(searchQuery);
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url!);
  if (response.statusCode == 200) {
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['results'][0]['original_title'];
    //print(itemCount);
   // print(Results.fromJson(jsonResponse).popularity);
    return MovieResult.fromJson(jsonResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future<MovieResult?> upcommingMovies() async {
  var url = Uri.tryParse(upcoming);
  List movies = [];
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    url!,
    headers: {
      HttpHeaders.authorizationHeader: bearer,
    },
  );
  if (response.statusCode == 200) {
    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
    var title = jsonResponse['total_results'];
    MovieResult.fromJson(jsonResponse).results.forEach((element) {
      print(element.posterPath);
    });
    return MovieResult.fromJson(jsonResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}