import 'package:senflix/api_key/api_key.dart';
// Search Query
 const String urlBase ="https://api.themoviedb.org/3/";
 String key = "&api_key=$apiKey";
 String searchQuery = "$urlBase/search/movie?query=Jack Reacher$key";
 const langue= "?language=fr-FR";
 const page ="&page=1";
const String upcomingMovies ="$urlBase/movie/upcoming$langue$page";

// for DISCOVERY
const sortByPopularityDesc='&sort_by=popularity.desc';
const String isIncludeVideo = '&include_video=true';

const discoveryForMovie = '$urlBase/discover/movie$langue$isIncludeVideo$page$sortByPopularityDesc';

const discoveryForTv =  '$urlBase/discover/tv$langue&$isIncludeVideo&$sortByPopularityDesc';

const trendingAll="$urlBase/trending/all/day";