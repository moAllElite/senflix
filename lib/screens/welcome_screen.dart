import 'package:flutter/material.dart';
import 'package:senflix/components/movies_section_widget.dart';
import 'package:senflix/models/movie_model.dart';
import 'package:senflix/services/movie_service.dart';
import 'package:senflix/utils/param_api.dart';
import '../components/custom_carousel_slider.dart';
import '../components/custom_color.dart';
import '../components/my_bottom_navigation.dart';
import '../components/title_section_widget.dart';
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
    int selectedIndex = 0;
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }
    return Scaffold(
      backgroundColor: isDark,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      bottomNavigationBar: myBottomNavigation(onItemTapped, selectedIndex)
    );
  }
}

