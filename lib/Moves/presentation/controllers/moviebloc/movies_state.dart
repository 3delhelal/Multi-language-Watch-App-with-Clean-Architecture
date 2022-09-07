import '/Core/utils/eums.dart';
import '/Moves/domain/entities/move.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final RequestState nowPlayingRequestState;
  final RequestState popularRequestState;
  final RequestState topRatedRequestState;
  final String nowPlayingErrorMessage;
  final String popularErrorMessage;
  final String topRatedErrorMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingRequestState = RequestState.loading,
    this.popularRequestState = RequestState.loading,
    this.topRatedRequestState = RequestState.loading,
    this.nowPlayingErrorMessage = '',
    this.popularErrorMessage = '',
    this.topRatedErrorMessage = '',
  });
  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    RequestState? nowPlayingRequestState,
    RequestState? popularRequestState,
    RequestState? topRatedRequestState,
    String? nowPlayingErrorMessage,
    String? popularErrorMessage,
    String? topRatedErrorMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      nowPlayingRequestState:
          nowPlayingRequestState ?? this.nowPlayingRequestState,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      nowPlayingErrorMessage:
          nowPlayingErrorMessage ?? this.nowPlayingErrorMessage,
      popularErrorMessage: popularErrorMessage ?? this.popularErrorMessage,
      topRatedErrorMessage: topRatedErrorMessage ?? this.topRatedErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
        nowPlayingRequestState,
        popularRequestState,
        topRatedRequestState,
        nowPlayingErrorMessage,
        popularErrorMessage,
        topRatedErrorMessage
      ];
}
