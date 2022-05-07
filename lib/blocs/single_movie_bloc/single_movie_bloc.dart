import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_project/models/movie.dart';
import 'package:movies_project/repositories/movies_repository.dart';

part 'single_movie_event.dart';
part 'single_movie_state.dart';

class SingleMovieBloc extends Bloc<SingleMovieEvent, SingleMovieState> {
  final MoviesRepository _moviesRepository;

  SingleMovieBloc(this._moviesRepository) : super(SingleMovieInitial()) {
    on<SingleMovieEvent>((event, emit) async {
      if (event is InitializeMovieEvent) {
        emit.call(NewMovieState(await _initializeMovies(event.movieId)));
      }
    });
  }

  Future<Movie> _initializeMovies(String movieId) async {
    return await _moviesRepository.getMovie(movieId);
  }
}
