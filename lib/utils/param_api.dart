import 'package:senflix/api_key/api_key.dart';
// Search Query
 const String urlBase ="https://api.themoviedb.org/3/";
 String key = "&api_key=$apiKey";
 String searchQuery = "$urlBase/search/movie?query=";
 const langue= "?language=fr-FR";
 const pageOne ="&page=1";
const String upcomingMovies ="$urlBase/movie/upcoming$langue$pageOne";

// for DISCOVERY
const sortByPopularityDesc='&sort_by=popularity.desc';
const String isIncludeVideo = '&include_video=false';

const discoveryForMovie = '$urlBase/discover/movie$langue$isIncludeVideo$pageOne$sortByPopularityDesc';

const discoveryForTv =  '$urlBase/discover/tv$langue&$isIncludeVideo&$sortByPopularityDesc';

const trendingAll="$urlBase/trending/all/day";

const topRated = "$urlBase/movie/top_rated?language=fr-FR&page=1&region=SN$isIncludeVideo";



String urlRecommandation (randomNumber){
 return '${urlBase}movie/$randomNumber/recommendations?language=fr-FR&page=1';

}