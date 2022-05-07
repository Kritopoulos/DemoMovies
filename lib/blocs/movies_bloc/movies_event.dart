part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class SearchMovieEvent extends MoviesEvent {
  final String movieTitle;
  final String page;

  SearchMovieEvent(this.movieTitle, this.page);
}
