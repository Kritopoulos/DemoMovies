import 'package:movies_project/api/movies_api.dart';
import 'package:movies_project/helpers/movies_helper.dart';
import 'package:movies_project/models/api_response.dart';
import 'package:movies_project/models/movie.dart';
import 'package:movies_project/utils/costants/consts_api.dart';

class MoviesRepository {
  final MoviesApi _moviesApi;

  MoviesRepository(this._moviesApi);

  Future<List<Movie>> getMovies(String movieTitle, String page) async {
    final queryParameters = {
      "apikey": ConstsApi.API_KEY,
      "s": movieTitle,
      "page": page
    };
    ApiResponse apiResponse = await _moviesApi.getMovies(queryParameters);
    return MoviesHelper.decodeMovies(apiResponse.body);
  }

  Future<Movie> getMovie(String movieId) async {
    final queryParameters = {
      "apikey": ConstsApi.API_KEY,
      'i': movieId,
    };
    ApiResponse apiResponse = await _moviesApi.getMovie(queryParameters);
    return MoviesHelper.decodeMovie(apiResponse.body);
  }
}
