import 'package:senflix/api_key/api_key.dart';
// Search Query
 const String urlBaseForSearch ="https://api.themoviedb.org/3/";
 String key = "&api_key=$apiKey";
 String searchQuery = "$urlBaseForSearch/search/movie?query=Jack Reacher$key";
 const langue= "?language=fr-FR";
 const page ="&page=1";
const String upcomingMovies ="$urlBaseForSearch/movie/upcoming$langue$page";

// for DISCOVERY
const String urlBaseForDiscovery= 'https://api.themoviedb.org/3/discover';
const sortByPopularityDesc='&sort_by=popularity.desc';
const String isIncludeVideo = '&include_video=true';

const discoveryForMovie = '${urlBaseForDiscovery}/movie${langue}${isIncludeVideo}${page}${sortByPopularityDesc}';

const discoveryForTv =  '${urlBaseForDiscovery}/tv${langue}&${isIncludeVideo}&${sortByPopularityDesc}';
