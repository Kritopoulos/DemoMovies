part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class NewMoviesListState extends MoviesState {
  final List<Movie> movies;

  NewMoviesListState(this.movies);
}
