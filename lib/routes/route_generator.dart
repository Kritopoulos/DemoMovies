import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_project/blocs/single_movie_bloc/single_movie_bloc.dart';
import 'package:movies_project/repositories/movies_repository.dart';
import 'package:movies_project/routes/routes.dart';
import 'package:movies_project/services/repositories_service.dart';
import 'package:movies_project/setup_locator.dart';
import 'package:movies_project/ui/screens/movies_screen.dart';
import 'package:movies_project/ui/screens/single_movie_screen.dart';

class RouteGenerator {
  static Route<dynamic>? geneRateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.moviesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<MoviesBloc>(
            create: (context) =>
                MoviesBloc(getIt<RepositoriesService>().moviesRepository),
            child: const MoviesScreen(),
          ),
        );
      case Routes.singleMovieScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SingleMovieBloc>(
            create: (context) =>
                SingleMovieBloc(getIt<RepositoriesService>().moviesRepository),
            child: SingleMovieScreen(
              movieId: settings.arguments,
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<MoviesBloc>(
            create: (context) =>
                MoviesBloc(getIt<RepositoriesService>().moviesRepository),
            child: const MoviesScreen(),
          ),
        );
    }
  }
}
