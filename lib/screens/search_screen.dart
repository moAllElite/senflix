import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:senflix/components/custom_text.dart';
import 'package:senflix/services/movie_service.dart';
import 'package:senflix/utils/param_api.dart';
import '../components/custom_color.dart';
import '../models/movie_model.dart';
import 'package:gap/gap.dart';

import '../utils/constant.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => SearchScreenState();

}

List<String> liste =  [' 1105407','967847','402693','9932',' 9566','40082','901405','15014','15069','5851'];

class SearchScreenState extends State<SearchScreen>{
  String movieName ='';
  String url='';
  String randomItem = liste[Random().nextInt(liste.length)];
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  late Future<MovieModel?> recommandation;
  @override
  void initState() {
    url = urlRecommandation(randomItem);
    recommandation = fetchMovieData(url);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: isDark,
      body: RefreshIndicator(
        color: isRed,
        notificationPredicate: (notification) => true,
        onRefresh: () async{
          setState(() {
            String randomId = liste[Random().nextInt(liste.length)];
            url = urlRecommandation(randomId);
            recommandation = fetchMovieData(url);
          });
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    onChanged: (value) {
                      movieName = value;
                    },
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Le champs  est obligatoire';
                      }
                      return null;
                    },
                    style: kTextStyle,
                    decoration: kTextFieldFormDecoration.copyWith(
                        iconColor: Colors.white,
                        prefixIcon: const Icon(Icons.search,size: 35.0 ,color: Colors.white,),
                        fillColor: Colors.grey,
                        errorStyle: const TextStyle(color: isRed,fontSize: 14.0),
                        focusColor: isGrey,
                        filled: true,
                        hintText: 'Search anime, movie, ...',
                        hintStyle: kTextStyle.copyWith(
                            color: Colors.grey.shade200
                        ),
                        suffixIcon: const Icon(Icons.mic,size: 35,color: Colors.white,)
                    ),
                  ),
                ),
              ),
              customText(
                'Animes & séries recommandés',
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 21.0,
                textAlign: TextAlign.start,
              ),
              const Gap(5),
              Expanded(
                  child: futureRecommandationMovie(recommandation)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget futureRecommandationMovie(Future<MovieModel?> recommandation){
  return FutureBuilder(
    future: recommandation,
    builder:(context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        List<Film> movies = snapshot.data!.results;
        return  ListView.builder(
          itemCount: movies.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return    Material(
              color: isDark,
              type: MaterialType.card,
              elevation: 5.0,
              child: Column(
                children: [
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                        imageUrl: 'https://image.tmdb.org/t/p/w200/${movies[index].posterPath}',
                        placeholder: (context, url) =>  customText(
                            'Chargement en cours',
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Expanded(
                        child: ListTile(
                          title:Padding(
                            padding: const EdgeInsets.symmetric(vertical: 55.0),
                            child: RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              text:TextSpan(
                                text: movies[index].title.toString(),
                                style: kTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ) ,
                          trailing:  IconButton(
                            icon: const Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                              size: 40.0,
                            ), onPressed: () {  },
                          ),
                        ),
                      ),

                    ],
                  ),

                  /*  ListTile(
                    title: customText('${movies[index].title}',
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                    leading: CachedNetworkImage(
                      height: 200,
                      width: 100,
                      fit: BoxFit.cover,
                      imageUrl: 'https://image.tmdb.org/t/p/w500/${movies[index].posterPath}',
                      placeholder: (context, url) =>  customText(
                          'Chargement en cours',
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.white,
                        size: 35.0,
                      ), onPressed: () {  },
                    ),
                    subtitle: customText(
                        movies[index].releaseDate.toString().split('-').first,
                        fontSize: 15.0,
                        maxLines: 1,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start
                    ),
                  ),*/
                  const Gap(40)
                ],
              ),
            );
          },
        );
      }else{
        return const Center(child: SpinKitRing(color: isRed));
      }
    },
  );
}