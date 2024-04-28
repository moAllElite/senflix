import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senflix/models/movie_model.dart';
import 'package:senflix/services/movie_service.dart';
import 'package:senflix/utils/param_api.dart';
import 'package:senflix/widgets/upcomming_movies_widget.dart';
import '../widgets/custom_color.dart';
import '../widgets/custom_carousel_slider.dart';
class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => WelcomePageState();

}

class WelcomePageState extends State<WelcomeScreen> with TickerProviderStateMixin{
  late Future<MovieModel?> commingMovies;
  late Future<MovieModel?> discoveryMovie;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    debugPrint(discoveryForMovie);
    commingMovies = fetchMovieData(upcomingMovies);
    discoveryMovie = fetchMovieData(discoveryForMovie);
  }
  @override
  Widget build(BuildContext context) {

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
            FutureBuilder(
              future: commingMovies,
              builder: (BuildContext context,  snapshot) {
                if( snapshot.connectionState == ConnectionState.done) {
                  return  upcommingMoviesWidget(context,snapshot.data);
                }else{
                  return  Center(
                    child:  SpinKitRing(
                      color: isRed,
                      size: 50.0,
                      controller: AnimationController(
                          vsync: this,
                          duration: const Duration(milliseconds: 2200)
                      ),
                    ),
                  );
                }
              },

            ),
          ],
        ),
      ),
    );
  }
}
