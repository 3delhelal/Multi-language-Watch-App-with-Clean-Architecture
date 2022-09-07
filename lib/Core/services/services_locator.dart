import '/Moves/data/datasource/base_move_remote_date_source.dart';
import '/Moves/data/datasource/movie_remote_data_source.dart';
import '/Moves/data/repository/movies_repository.dart';
import '/Moves/domain/repository/base_movies_repository.dart';
import '/Moves/domain/usecases/get_now_playing_movies.dart';
import '/Moves/domain/usecases/get_popular_movies.dart';
import '/Moves/domain/usecases/get_toprated_movies.dart';
import '/Moves/presentation/controllers/moviebloc/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sld = GetIt.instance; // Stands for : Service Locator Direct

class ServiceLocator {
  void init() {
    // Bloc
    sld.registerLazySingleton(() => MoviesBloc(sld(), sld(), sld()));

    // Use Cases
    sld.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(sld()));
    sld.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(sld()));
    sld.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(sld()));

    // Repository
    sld.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sld()));

    // Data Source
    sld.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
