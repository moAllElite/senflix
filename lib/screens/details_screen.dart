import 'package:flutter/material.dart';
import 'package:senflix/components/custom_text.dart';
import 'package:senflix/components/my_snack_bar.dart';
import 'package:senflix/models/movie_model.dart';
import 'package:senflix/models/video_model.dart';
import 'package:senflix/services/video_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../components/flat_button.dart';
import '../services/details_service.dart';
import '../components/custom_color.dart';
class DetailsScreen extends StatefulWidget{
  const DetailsScreen({super.key,
    required this.movieId,
    // required this.video
  });
  final  int movieId;
//  final Future<VideoModel?> video;
  @override
  State<StatefulWidget> createState() => DetailsScreenState ();
}

class DetailsScreenState extends State<DetailsScreen>{
  late Future<Film?> movieDetails ;
  late Future<VideoModel?> video;
  late int id;
  String key="";
  @override
  void initState() {
    super.initState();
    id = widget.movieId;
    String url = 'https://api.themoviedb.org/3/movie/${widget.movieId}?language=fr-FR';
    movieDetails = getFilmDetails(url);
    video =  fetchVideoData(widget.movieId);
    setState(() {
      video.then((value) => key = value!.results.first.key.toString());
    });
  }
  @override

  @override
  Widget build(BuildContext context) {
    Color playButtonColor = Colors.white;
    Color downloadButtonColor = isGrey;
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: video,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  final youtubePlayerController = YoutubePlayerController(
                    initialVideoId: snapshot.data!.results.first.key,
                    flags: const YoutubePlayerFlags(
                      controlsVisibleAtStart: true,
                      autoPlay: false,
                      mute: false,
                      captionLanguage: 'en-Us',
                      forceHD: true,
                      enableCaption: false,
                    ),
                  );
                  final youtubePlayer = YoutubePlayer(
                    controller: youtubePlayerController,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: isRed,
                    progressColors: const ProgressBarColors(
                      playedColor: isRed,
                      handleColor: isRed,
                    ),
                    onReady: () {
                      //   youtubePlayerController.addListener(listener);
                    },
                  );

                  return  Container(
                    margin: const EdgeInsets.symmetric(vertical: 9.0),
                    child:   YoutubePlayerBuilder(
                        player:youtubePlayer,
                        builder: (context, player){
                          return Column(
                            children: [
                              player,
                            ],
                          );
                        }
                    ),
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(color: isRed,));
                }
              },
            ),
            FutureBuilder(future: movieDetails,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  Film? film = snapshot.data;
                  return  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: customText(
                            '${film?.title}',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.symmetric(vertical: 3.0),
                        child: customText(
                            '${film?.releaseDate?.split("-").first}',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w200
                        ),
                      ),
                      FlatButton(
                        buttonColor: playButtonColor,
                        onPressed: () {
                        },
                        fontSize: 20.0,
                        textColor: isDark,
                        fontWeight: FontWeight.normal,
                        text: 'Play',
                        Icons.play_arrow_sharp,
                      ),
                      FlatButton(
                        buttonColor: downloadButtonColor,
                        onPressed: (){
                          return ScaffoldMessenger.of(context).showSnackBar(
                              mySnackBar(backgroundColor: Colors.blue, message: 'Service indisponible')
                          );
                        },
                        text: 'Télécharger',
                        fontSize: 20.0,
                        textColor: Colors.white,
                        fontWeight: FontWeight.normal,
                        Icons.download_sharp,
                      ),

                      const SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: customText(
                            '${film?.overview}',
                            fontSize: 14.0,
                            textAlign: TextAlign.left
                        ),
                      ),
                    ],
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(color:isRed),);
                }
              },
            ),
          ],
        ),
      ),
    );

  }

}