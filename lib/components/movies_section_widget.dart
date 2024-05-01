import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senflix/models/movie_model.dart';

import 'custom_color.dart';


Widget  sectionFutureBuilder ({required Future<MovieModel?> futureMovie,required dynamic tickerProvider}){
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12.0),
    child: FutureBuilder(
      future: futureMovie,
      builder: (BuildContext context,  snapshot) {
        if( snapshot.connectionState == ConnectionState.done) {
          return  moviesSectionWidget(context,snapshot.data);
        }else{
          return  Center(
            child:  SpinKitRing(
              color: isRed,
              size: 50.0,
              controller: AnimationController(
                  vsync: tickerProvider,
                  duration: const Duration(milliseconds: 5200)
              ),
            ),
          );
        }
      },

    ),
  );

}


Widget moviesSectionWidget (BuildContext context,MovieModel? data) {
  return SizedBox(
    height: 205,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: data!.results.length,
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return  Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
              child: Image.network(
                  'https://image.tmdb.org/t/p/w200/${data.results[index].posterPath}'
              ),
            ),
          ],
        );
      },
    ),
  );
}


