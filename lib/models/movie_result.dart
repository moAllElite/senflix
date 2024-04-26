

class MovieResult {
  late List<Film> results;
 late int page;
  late  int totalResults;
 late int totalPages;

  MovieResult({
    required  this.results,
    required this.page,
    required  this.totalResults,
    required this.totalPages,
  });

  MovieResult.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Film>[];
      json['results'].forEach((v) {
        results.add(Film.fromJson(v));
      });
    }
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJson()).toList();
    data['page'] = page;
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    return data;
  }
}


class Film {
  late  String? backdropPath;
  late int? id;
  late String? originalLanguage;
  late  String? overview;
  late  double? popularity;
  late  String? posterPath;
  late String? releaseDate;
  late String? title;
  late double? voteAverage;
  late int? voteCount;
  Film({
    required  this.backdropPath,
    required  this.id,
    required  this.originalLanguage,
    required  this.overview,
    required  this.popularity,
    required  this.posterPath,
    required  this.releaseDate,
    required  this.title,
    required  this.voteAverage,
    required  this.voteCount
  });

  Film.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
