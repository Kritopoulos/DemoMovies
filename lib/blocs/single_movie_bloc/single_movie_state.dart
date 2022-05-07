part of 'single_movie_bloc.dart';

@immutable
abstract class SingleMovieState {}

class SingleMovieInitial extends SingleMovieState {}

class NewMovieState extends SingleMovieState {
  final Movie movie;

  NewMovieState(this.movie);
}
