
import 'package:movies_project/models/api_response.dart';
import 'package:movies_project/utils/costants/consts_api.dart';
import 'package:movies_project/utils/http.dart';

class MoviesApi extends Http{

  Future<ApiResponse> getMovies(Map<String,String> queryParameters) async => await getHandler(ConstsApi.MOVIES_URL,queryParameters);

  Future<ApiResponse> getMovie(Map<String,String> queryParameters) async => await getHandler(ConstsApi.MOVIES_URL,queryParameters);

}