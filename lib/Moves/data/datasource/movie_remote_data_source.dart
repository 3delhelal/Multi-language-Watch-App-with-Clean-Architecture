import '/Core/error/server_exception.dart';
import '/Core/network/api_constance.dart';
import '/Core/network/model/error_message_model.dart';
import '/Moves/data/models/movie_model.dart';
import 'package:dio/dio.dart';

import 'base_move_remote_date_source.dart';
// import 'package:http/http.dart' as http;

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  MovieRemoteDataSource({super.language = 'en'});
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final repsonse = await Dio()
        .get('${ApiConstance.nowPlayingMoviesUrlPath}&language=$language')
        .onError((error, stackTrace) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: 404,
              statusMessage: 'Failed to get Now Playing Movies from the Api',
              success: false));
    });
    if (repsonse.statusCode == 200) {
      return List<MovieModel>.from(repsonse.data['results']
          .map((element) => MovieModel.fromJson(element)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson({
        'status_code': repsonse.statusCode,
        'status_message': 'Something went Wrong',
        'success': false
      }));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final repsonse = await Dio()
        .get('${ApiConstance.nowPlayingMoviesUrlPath}&language=$language')
        .onError((error, stackTrace) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: 404,
              statusMessage: 'Failed to get Popular Movies from the Api',
              success: false));
    });
    if (repsonse.statusCode == 200) {
      return List<MovieModel>.from(repsonse.data['results']
          .map((element) => MovieModel.fromJson(element)));
    } else {
      return throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(repsonse.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final repsonse = await Dio()
        .get('${ApiConstance.nowPlayingMoviesUrlPath}&language=$language')
        .onError((error, stackTrace) {
      throw const ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: 404,
              statusMessage: 'Failed to get Top Rated Movies from the Api',
              success: false));
    });
    if (repsonse.statusCode == 200) {
      return List<MovieModel>.from(repsonse.data['results']
          .map((element) => MovieModel.fromJson(element)));
    } else {
      return throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(repsonse.data));
    }
  }
}
