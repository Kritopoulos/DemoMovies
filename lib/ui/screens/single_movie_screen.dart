import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/blocs/single_movie_bloc/single_movie_bloc.dart';
import 'package:movies_project/models/movie.dart';
import 'package:movies_project/ui/components/image_builder.dart';
import 'package:movies_project/utils/costants/consts_style.dart';

class SingleMovieScreen extends StatefulWidget {
  const SingleMovieScreen({Key? key, required this.movieId}) : super(key: key);
  final Object? movieId;

  @override
  State<SingleMovieScreen> createState() => _SingleMovieScreenState();
}

class _SingleMovieScreenState extends State<SingleMovieScreen> {
  late SingleMovieBloc singleMovieBloc;
  String title = "Loading";
  Movie? movie;
  late Size _screenSize;

  @override
  void initState() {
    super.initState();

    singleMovieBloc = BlocProvider.of<SingleMovieBloc>(context);
    singleMovieBloc.add(InitializeMovieEvent(widget.movieId.toString()));
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    return BlocConsumer<SingleMovieBloc, SingleMovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewMovieState) {
          title = state.movie.title;
          movie = state.movie;
        }
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: mainBody(movie),
        );
      },
    );
  }

  Widget mainBody(Movie? movie) {
    if (movie == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: _screenSize.height * 0.4,
            child: ImageBuilder(
              imageUrl: movie.poster,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Τίτλος: ${movie.title}",
            textAlign: TextAlign.center,
          ),
          Text(
            "Ημερομηνία κυκλοφορίας: ${movie.releaseDate}",
            textAlign: TextAlign.center,
          ),
          Text(
            "Είδος: ${movie.genre}",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Περιγρφή",
            style: TextStyle(fontSize: StyleConstants.titleFontSize),
          ),
          const Divider(),
          Text("Είδος: ${movie.plot}", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
