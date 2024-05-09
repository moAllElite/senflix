import 'package:senflix/models/resultats_video_model.dart';

class VideoModel {
  late final int id;
  late final List<ResultatsVideoModel> results;

  VideoModel({required this.id, required this.results});

  /* factory VideoModel.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'id': int id,
      'results':List<ResultatsVideoModel>results,

      } =>
          VideoModel(
              id: id,
              results: results
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }*/

  VideoModel.fromJson(Map<String,dynamic> json){
    if (json['results'] != null) {
      results = <ResultatsVideoModel>[];
      json['results'].forEach((v) {
        results.add(ResultatsVideoModel.fromJson(v));
      });
    }
    id = json['id'];

  }
}