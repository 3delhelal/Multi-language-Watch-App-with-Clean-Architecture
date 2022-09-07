import '/Core/error/failure.dart';
import '/Core/error/server_exception.dart';
import '/Moves/data/models/movie_model.dart';
import '/Moves/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasource/base_move_remote_date_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Falure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      var result = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerException catch (error) {
      return left(ServerFalure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Falure, List<MovieModel>>> getPopularMovies() async {
    try {
      var result = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFalure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Falure, List<MovieModel>>> getTopRatedMovies() async {
    try {
      var result = await baseMovieRemoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFalure(error.errorMessageModel.statusMessage));
    }
  }
}
