part of 'single_movie_bloc.dart';

@immutable
abstract class SingleMovieEvent {}

class InitializeMovieEvent extends SingleMovieEvent {
  final String movieId;

  InitializeMovieEvent(this.movieId);
}
