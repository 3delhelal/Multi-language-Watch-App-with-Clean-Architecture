import 'package:cleanarchwatchapp/Moves/domain/entities/move.dart';
import 'package:cleanarchwatchapp/Moves/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '/Core/error/failure.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);
  Future<Either<Falure, List<Movie>>> call() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
