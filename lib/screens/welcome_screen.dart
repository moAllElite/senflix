import 'package:flutter/material.dart';
import 'package:senflix/utils/movie_api.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => WelcomePageState();

}

class WelcomePageState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(onPressed: ()async{
         // upcommingMovies();
          searchMovieByName();
        },
          color: Colors.lightBlue,
          child: const Text('click me'),
        ),
      ),
    );
  }
}