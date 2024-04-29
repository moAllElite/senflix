import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:senflix/models/movie_model.dart';
import 'package:senflix/widgets/custom_text_button_with_icon.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'my_animated_smooth__indicator.dart';
import 'custom_color.dart';
import 'custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CarouselSliderCustom extends StatefulWidget{
  final Future<MovieModel?> movie;

  const CarouselSliderCustom({super.key,required this.movie});

  @override
  State<CarouselSliderCustom> createState() => _CarouselSliderCustomState();
}

class _CarouselSliderCustomState extends State<CarouselSliderCustom> {

  final PageController pageController = PageController(viewportFraction: 0.8, keepPage: true);

  var currentPage=0;


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FutureBuilder(
              future: widget.movie,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  MovieModel discoveryMovies = snapshot.data;
                  return Column(
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      CarouselSlider.builder(
                        options:CarouselOptions(
                            height: 410.0,
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
                              });
                            }),
                        itemCount: 6,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                              height: 200,
                              margin: const EdgeInsets.symmetric(horizontal: 35.0),
                              child: Image.network(
                                ( defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android)?
                                'https://image.tmdb.org/t/p/w300/${discoveryMovies.results[index].posterPath}':
                                'https://image.tmdb.org/t/p/original/${discoveryMovies.results[index].posterPath}',
                                fit: BoxFit.cover,
                              )
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 9.0),
                        child: myAnimatedSmoothIndicator(
                            currentPage,6
                          ),
                      ),
                    ],
                  );
                }else{
                  return const Center(
                    child: SizedBox(
                      width: 6,
                      child: CircularProgressIndicator(
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
                  bottom: 15.0
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customTextButtonWithIcon(
                      text: 'Play',
                      icon: Icons.play_arrow_sharp
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  customTextButtonWithIcon(
                    text: 'Favoris',
                    textColor: Colors.white,
                    icon: Icons.add,
                    colorIcon: Colors.white,
                    backgrounColor: isGrey,
                  ),

                ],
              ),
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 9.0,horizontal: 9.0),
            alignment: Alignment.topLeft,
            child: customText(
                'A venir',
                fontSize: 25.0,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold
            ),
          ),

        ]
    );
  }


}

