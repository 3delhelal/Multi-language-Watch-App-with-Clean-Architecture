import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  String language;
  BaseMovieRemoteDataSource({this.language = 'en'});
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}
