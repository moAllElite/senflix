import 'package:senflix/api_key/api_key.dart';

 const String urlBase ="https://api.themoviedb.org/3/";
 String key = "&api_key=$apiKey";
 String searchQuery = "$urlBase/search/movie?query=Jack Reacher$key";
 const langue= "?language=fr-FR";
 const page ="&page=2";
const String upcoming ="$urlBase/movie/upcoming$langue$page";