class PopMovie {
  final int id;
  final String title;
  final String overview;
  final String vote_average;
  final List? genres;
  final List? casts;

  PopMovie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.vote_average,
      required this.genres,
      required this.casts});

  factory PopMovie.fromJson(Map<String, dynamic> json) {
    return PopMovie(
        id: json['movie_id'],
        title: json['title'],
        overview: json['overview'],
        vote_average: json['vote_average'],
        genres: json['genres'],
        casts: json['casts']);
  }
}
