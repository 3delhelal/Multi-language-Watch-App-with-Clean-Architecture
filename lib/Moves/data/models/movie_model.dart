import '/Moves/domain/entities/move.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });
  factory MovieModel.fromJson(Map<String, dynamic> jsonMap) {
    return MovieModel(
        id: jsonMap['id'],
        title: jsonMap['title'],
        backdropPath: jsonMap['backdrop_path'],
        genreIds:
            List<int>.from(jsonMap['genre_ids'].map((element) => element)),
        overview: jsonMap['overview'],
        voteAverage: jsonMap['vote_average'].toDouble(),
        releaseDate: jsonMap['release_date']);
  }
}
