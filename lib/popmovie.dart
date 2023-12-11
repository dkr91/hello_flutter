import 'package:hello_flutter/genre.dart';

class PopMovie {
  int id;
  String title;
  String homepage;
  String overview;
  String vote_average;
  String release_date;
  int runtime;
  List<Genre?>? genres;
  List? casts;

  PopMovie(
      {required this.id,
      required this.title,
      required this.homepage,
      required this.overview,
      required this.vote_average,
      required this.release_date,
      required this.runtime,
      required this.genres,
      required this.casts});

  factory PopMovie.fromJson(Map<String, dynamic> json) {
    return PopMovie(
        id: json['movie_id'],
        title: json['title'],
        homepage: json['homepage'],
        overview: json['overview'],
        vote_average: json['vote_average'],
        release_date: json['release_date'],
        runtime: json['runtime'],
        genres: json['genres'] == null
            ? null
            : List<Genre?>.from(json['genres'].map((x) => Genre.fromJSON(x))),
        casts: json['casts']);
  }
}
