class MovieModel {
  final String title, backdrop, poster, overview;
  final num vote;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        backdrop = json['backdrop_path'],
        poster = json['poster_path'],
        vote = json['vote_average'],
        overview = json['overview'];
}
