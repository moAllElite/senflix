import 'package:flutter/material.dart';
import 'package:senflix/models/movie_result.dart';

Widget PosterListView (MovieResult? data) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data!.results.length,
      itemBuilder: (context, index) {
        return  Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w200/${data.results[index].posterPath}'
              ),
            ),
          ],
        );
      },
  );
}