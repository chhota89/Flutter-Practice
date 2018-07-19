import 'package:meta/meta.dart';

class Movie {
  Movie({
    @required this.title,
    @required this.posterPath,
    @required this.id,
    @required this.overview,
    this.favored,
  });

  String title, posterPath, id, overview;
  bool favored;

  Movie.fromJson(Map json)
      : title = json["title"],
        posterPath = json["posterPath"],
        id = json["id"].toString(),
        overview = json["overview"],
        favored = false;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['poster_path'] = posterPath;
    map['overview'] = overview;
    map['favored'] = favored;
    return map;
  }
}
