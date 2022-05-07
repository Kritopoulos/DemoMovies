import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_project/models/movie.dart';
import 'package:movies_project/repositories/movies_repository.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository _moviesRepository;
  String movieTitle = "";

  MoviesBloc(this._moviesRepository) : super(MoviesInitial()) {
    on<MoviesEvent>((event, emit) async {
      if (event is SearchMovieEvent) {
        movieTitle = event.movieTitle;
        _moviesSink.add(
          await _initializeMovies(event.movieTitle, event.page),
        );
      }
    });
  }

  final StreamController<List<Movie>> _moviesStreamController =
      StreamController<List<Movie>>.broadcast();

  Sink<List<Movie>> get _moviesSink => _moviesStreamController.sink;

  Stream<List<Movie>> get moviesStream =>
      _moviesStreamController.stream.asBroadcastStream();

  Future<List<Movie>> _initializeMovies(String movieTitle, String page) async {
    return await _moviesRepository.getMovies(movieTitle, page);
  }
}
