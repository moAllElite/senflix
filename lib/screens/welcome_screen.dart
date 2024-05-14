import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senflix/components/movies_section_widget.dart';
import 'package:senflix/models/movie_model.dart';
import 'package:senflix/models/video_model.dart';
import 'package:senflix/services/movie_service.dart';
import 'package:senflix/utils/param_api.dart';
import '../components/custom_carousel_slider.dart';
import '../components/custom_color.dart';
import '../components/title_section_widget.dart';
import '../utils/constant.dart';
class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => WelcomePageState();

}

class WelcomePageState extends State<WelcomeScreen> with TickerProviderStateMixin{
  late Future<MovieModel?> commingMovies;
  late Future<MovieModel?> discoveryMovie;
  late Future<MovieModel?> trendings;
  late Future<MovieModel?> filterTopRated;
  late Future<VideoModel> video;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    filterTopRated = fetchMovieData(topRated);
    commingMovies = fetchMovieData(upcomingMovies);
    discoveryMovie = fetchMovieData(discoveryForMovie);
    trendings = fetchMovieData(trendingAll);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark,
      appBar: AppBar(
        backgroundColor: isDark,
        leading: Container(
            height: 45.0,
            margin: const EdgeInsets.only(left: 25.0),
            child:  SvgPicture.string(
              netflixIconSvg,
              width: 15,
              height: 15,
            )
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Hero(
              tag: 'search',
              child: IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context,'/search_screen');
                  },
                  icon: const Icon(Icons.search,size: 34.0,color: Colors.white,)
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true ,
          bottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ) ,
              CarouselSliderCustom(
                movie: discoveryMovie
              ),
              titleSectionWidget(data: 'Tendance'),
              sectionFutureBuilder(
                  futureMovie: trendings,
                  tickerProvider: this
              ),
              titleSectionWidget(data: 'A venir'),
              sectionFutureBuilder(
                  futureMovie: commingMovies,
                  tickerProvider:  this
              ),
              titleSectionWidget(data: 'Les meilleurs notés'),
              sectionFutureBuilder(
                  futureMovie: filterTopRated,
                  tickerProvider: this)

            ],
          ),
        ),
      ),

    );
  }
}

