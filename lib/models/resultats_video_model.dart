class ResultatsVideoModel{
  late final String site;
  late final String languague;
  late final String type;
  late final int size;
  late final String name;
  late final  String country;
  late final String key;
  late final bool official;
  late final String publishedAt;

  ResultatsVideoModel({
    required this.site,
    required this.languague,
    required this.type,
    required this.size,
    required   this.name,
    required   this.country,
    required      this.key,
    required     this.official,
    required    this.publishedAt
  });


  ResultatsVideoModel.fromJson(Map<String,dynamic> json){
   languague =json['iso_639_1'];
   country = json['iso_3166_1'];
   name = json['name'];
    key = json['key'];
   site = json['site'];
   size = json['size'];
   type= json['type'];
   official = json["official"];
    publishedAt = json["published_at"];
  }


  /*factory ResultatsVideoModel.fromJson(Map<String,dynamic> json){
    return switch(json){

      {
      "language": String language,
      "country": String country,
      "name": String name,
      "key": String key,
      "site": String site,
      "size": int size,
      "type": String type,
      "official": bool official,
      "published_at": DateTime publishedAt,
      } =>
          ResultatsVideoModel(
            size: size,
            country: country,
            key: key,
            languague: language,
            name: name,
            official: official,
            publishedAt: publishedAt,
            site: site,
            type: type,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }*/


}