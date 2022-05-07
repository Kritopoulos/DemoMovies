class Movie {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;
  final String plot;
  final String genre;
  final String releaseDate;

  Movie(
      {required this.plot,
      required this.genre,
      required this.releaseDate,
      required this.title,
      required this.year,
      required this.imdbId,
      required this.type,
      required this.poster});
}
