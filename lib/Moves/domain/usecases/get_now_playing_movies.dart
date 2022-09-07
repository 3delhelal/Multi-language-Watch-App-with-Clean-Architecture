import '/Moves/domain/entities/move.dart';
import '/Moves/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '/Core/error/failure.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  /// callable class feature, you dont need to call it, it allows the instance to be called as a function.
  Future<Either<Falure, List<Movie>>> call() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }

  // @Deprecated(
  //     'This Method is not used anymore after using call method which allows the instance to be called as a function.')

  /// Get the data from Movie Repository.
  Future<Either<Falure, List<Movie>>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
