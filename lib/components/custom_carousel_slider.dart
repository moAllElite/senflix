import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senflix/models/movie_model.dart';
import 'package:senflix/components/text_button_with_icon.dart';
import 'package:senflix/models/video_model.dart';
import 'package:senflix/screens/details_screen.dart';
import 'package:senflix/services/video_service.dart';
import 'my_animated_smooth__indicator.dart';
import 'custom_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CarouselSliderCustom extends StatefulWidget{
  final Future<MovieModel?> movie;

  const CarouselSliderCustom({super.key,required this.movie});

  @override
  State<CarouselSliderCustom> createState() => _CarouselSliderCustomState();
}

class _CarouselSliderCustomState extends State<CarouselSliderCustom> {
  late Future<VideoModel?> video ;
  var currentPage=0;
  int movieId= 0;
  Color getColor(Color buttonColor){
    return  Colors.white !=  buttonColor ? Colors.white: isDark;
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder(
                future: widget.movie,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                    MovieModel discoveryMovies = snapshot.data;
                    return Column(
                      children: [
                        CarouselSlider.builder(
                          options:CarouselOptions(
                              height: 380.0,
                              enlargeCenterPage: true,
                              aspectRatio: 16/9,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration: const Duration(milliseconds: 900),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              scrollDirection: Axis.horizontal,
                              onPageChanged:  (index, reason) {
                                setState(() {
                                  currentPage = index;
                                  var currentMovieId = discoveryMovies.results[index].id;
                                  video = fetchVideoData(currentMovieId!);
                                  video.then((value) =>
                                   debugPrint( value?.results.first.key.toString())
                                  );
                                });
                              }),
                          itemCount: 6,
                          itemBuilder: (context, index, realIndex) {
      
                            return Container(
                                height: 300,
                                margin: const EdgeInsets.symmetric(horizontal: 35.0),
                                child: InkWell(
                                  child: Image.network(
                                    ( defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android)?
                                    'https://image.tmdb.org/t/p/w500/${discoveryMovies.results[index].posterPath}':
                                    'https://image.tmdb.org/t/p/original/${discoveryMovies.results[index].posterPath}',
                                    fit: BoxFit.cover,
                                  ),
      
                                  onTap: () {
                                    movieId = discoveryMovies.results[index].id!;
                                    video = fetchVideoData(movieId);
                                   // video.then((value) => print(value!.results.first.key));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>  DetailsScreen(
                                            movieId:movieId,
                                           // video: video,
                                          ),
                                        )
                                    );
                                  },
                                )
                            );
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 7.0),
                          child: myAnimatedSmoothIndicator(
                              currentPage,6
                          ),
                        ),
                      ],
                    );
                  }else{
                    return const SizedBox(
                      height: 620,
                      child: Center(
                        child: SpinKitRing(
                          color: isRed,
                        ),
                      ),
                    );
                  }
                }
            ),
      
            Center(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 6.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textButtonWithIcon(
                        text: 'Play',
                        icon: Icons.play_arrow_sharp,
                        color: getColor(Colors.white)
                      , backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    textButtonWithIcon(
                      text: 'Favoris',
                      color: getColor(isGrey),
                      icon: Icons.add,
                      backgroundColor: isGrey,
                    ),
      
                  ],
                ),
              ),
            ),
      
      
          ]
      ),
    );
  }


}

