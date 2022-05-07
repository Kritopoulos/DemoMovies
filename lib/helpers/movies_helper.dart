import 'package:movies_project/models/movie.dart';

class MoviesHelper {
  static List<Movie> decodeMovies(Map<String, dynamic> moviesMap) {
    List<Movie> returnedList = [];
    if (moviesMap["Search"] == null) {
      return [];
    }
    moviesMap["Search"].forEach((value) {
      returnedList.add(
        Movie(
            imdbId: value["imdbID"] ?? "",
            title: value["Title"] ?? "",
            poster: value["Poster"] ?? "",
            type: value["Type"] ?? "",
            year: value["Year"] ?? "",
            plot: "",
            genre: "",
            releaseDate: ""),
      );
    });
    return returnedList;
  }

  static Movie decodeMovie(Map<String, dynamic> moviesMap) {
    return Movie(
        imdbId: moviesMap["imdbID"] ?? "",
        title: moviesMap["Title"] ?? "",
        poster: moviesMap["Poster"] ?? "",
        type: moviesMap["Type"] ?? "",
        year: moviesMap["Year"] ?? "",
        plot: moviesMap["Plot"] ?? "",
        genre: moviesMap["Genre"] ?? "",
        releaseDate: moviesMap["Released"] ?? "");
  }
}
