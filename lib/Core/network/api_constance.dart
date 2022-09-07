class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static const String apiKey = '7b83697a192c75e88735d569cd969dcb';
  static const String language = 'en';
  static const String moviePath = 'movie';
  static const String tvPath = 'tv';
  static const String nowPlayingMoviesUrlPath =
      '$baseUrl/$moviePath/now_playing?api_key=$apiKey&language=$language';
  static const String popularMoviesUrlPath =
      '$baseUrl/$moviePath/popular?api_key=$apiKey&language=$language';
  static const String topRatedMoviesUrlPath =
      '$baseUrl/$moviePath/top_rated?api_key=$apiKey&language=$language';

  static String imageUrl(String backdropPath) {
    return '$baseImageUrl$backdropPath';
  }

  static String getMovieDetailUrlPath(int movieId) {
    return '$baseUrl/$moviePath/$movieId?api_key=$apiKey';
  }

  static String getRecommendationMoviesUrlPath(int movieId) {
    return '$baseUrl/$moviePath/$movieId/recommendations?api_key=$apiKey';
  }
}
