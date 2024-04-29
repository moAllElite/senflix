import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senflix/models/movie_model.dart';

Widget upcommingMoviesWidget (BuildContext context,MovieModel? data) {
  return SizedBox(
    height: 240,
    child: ListView.builder(
 //     shrinkWrap: true,
      itemCount: data!.results.length,
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return  Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
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