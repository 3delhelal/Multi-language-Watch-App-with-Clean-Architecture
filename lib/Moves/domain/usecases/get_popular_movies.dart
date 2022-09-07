import '/Moves/domain/entities/move.dart';
import '/Moves/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '/Core/error/failure.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  Future<Either<Falure, List<Movie>>> call() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
