import 'dart:async';
import '/Moves/domain/usecases/get_now_playing_movies.dart';
import '/Moves/domain/usecases/get_popular_movies.dart';
import '/Moves/domain/usecases/get_toprated_movies.dart';
import '/Moves/presentation/controllers/moviebloc/movies_events.dart';
import '/Moves/presentation/controllers/moviebloc/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/Core/utils/eums.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(onGetNowPlayingEventMethod);
    on<GetPopularMoviesEvent>(onGetPopularEventMethod);
    on<GetTopRatedMoviesEvent>(onGetTopRatedEventMethod);
  }
  FutureOr<void> onGetTopRatedEventMethod(event, emit) async {
    final result = await getTopRatedMoviesUseCase();
    result.fold(
      (l) {
        emit(state.copyWith(
          topRatedRequestState: RequestState.error,
          topRatedErrorMessage: l.message,
        ));
      },
      (r) {
        emit(state.copyWith(
          topRatedRequestState: RequestState.loaded,
          topRatedMovies: r,
        ));
      },
    );
  }

  FutureOr<void> onGetPopularEventMethod(event, emit) async {
    final result = await getPopularMoviesUseCase();
    result.fold(
      (l) {
        emit(state.copyWith(
          popularRequestState: RequestState.error,
          popularErrorMessage: l.message,
        ));
      },
      (r) {
        emit(state.copyWith(
          popularRequestState: RequestState.loaded,
          popularMovies: r,
        ));
      },
    );
  }

  FutureOr<void> onGetNowPlayingEventMethod(event, emit) async {
    emit(state.copyWith(nowPlayingRequestState: RequestState.loading));

    final result = await getNowPlayingMoviesUseCase();
    result.fold(
      (l) {
        emit(state.copyWith(
            nowPlayingRequestState: RequestState.error,
            nowPlayingErrorMessage: l.message));
      },
      (r) {
        emit(state.copyWith(
          nowPlayingRequestState: RequestState.loaded,
          nowPlayingMovies: r,
        ));
      },
    );
  }
}
