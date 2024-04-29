import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senflix/models/movie_model.dart';
import 'package:senflix/services/movie_service.dart';
import 'package:senflix/utils/param_api.dart';
import 'package:senflix/widgets/movies_section_widget.dart';
import 'package:senflix/widgets/my_bottom_navigation.dart';
import '../widgets/custom_color.dart';
import '../widgets/custom_carousel_slider.dart';
import '../widgets/title_section_widget.dart';
class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => WelcomePageState();

}

class WelcomePageState extends State<WelcomeScreen> with TickerProviderStateMixin{
  late Future<MovieModel?> commingMovies;
  late Future<MovieModel?> discoveryMovie;
  late Future<MovieModel?> trendings;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    debugPrint(discoveryForMovie);
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
            const SizedBox(
              height: 12.0,
            ),
            titleSectionWidget(data: 'Tendance'),
            sectionFutureBuilder(
                futureMovie: trendings,
                tickerProvider: this
            ),
            const SizedBox(
              height: 12.0,
            ),
            titleSectionWidget(data: 'A venir'),
            sectionFutureBuilder(
                futureMovie: commingMovies,
                tickerProvider:  this
            ),
            const SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: myBottomNavigation(onItemTapped, selectedIndex)
    );
  }
}

