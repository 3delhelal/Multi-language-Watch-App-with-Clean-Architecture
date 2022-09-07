import '/Moves/domain/entities/move.dart';

import 'package:dartz/dartz.dart';

import '/Core/error/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Falure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Falure, List<Movie>>> getPopularMovies();
  Future<Either<Falure, List<Movie>>> getTopRatedMovies();
}
