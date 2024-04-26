import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senflix/models/movie_result.dart';
import 'package:senflix/screens/poster_list_view.dart';
import 'package:senflix/utils/movie_api.dart';

import '../utils/custom_color.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => WelcomePageState();

}

class WelcomePageState extends State<WelcomeScreen> with TickerProviderStateMixin{
  late Future<MovieResult?> data;
  @override
  void initState() {
    super.initState();
    data = upcommingMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark,
      body:FutureBuilder(
        future: data,
        builder: (BuildContext context,  snapshot) {
          if( snapshot.connectionState == ConnectionState.done) {
            return  PosterListView(snapshot.data);
          }else{
            return  Center(
              child:  SpinKitSquareCircle(
                color: isRed,
                size: 50.0,
                controller: AnimationController(
                    vsync: this,
                    duration: const Duration(milliseconds: 1200)
                ),
              ),
            );
          }
        },

      )
    );
  }
}