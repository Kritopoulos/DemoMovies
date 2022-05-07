import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import 'package:movies_project/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_project/models/movie.dart';
import 'package:movies_project/routes/routes.dart';
import 'package:movies_project/ui/components/custom_load_more_delegate.dart';
import 'package:movies_project/ui/components/image_builder.dart';
import 'package:movies_project/utils/costants/const_methods.dart';
import 'package:movies_project/utils/costants/consts_style.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesBloc moviesBloc;
  late Size _screenSize;
  List<Movie> movies = [];
  List<Movie> tempMovies = [];
  bool isFinished = false;
  int page = 1;
  TextEditingController controller = TextEditingController();
  StreamController<List<Movie>> moviesStream = StreamController();

  @override
  void initState() {
    super.initState();
    moviesBloc = BlocProvider.of<MoviesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Movies App"),
      ),
      resizeToAvoidBottomInset: false,
      body: BlocListener<MoviesBloc, MoviesState>(
        listener: (context, state) {
          if(state is NewMoviesListState){
            movies.addAll(state.movies);
            moviesStream.sink.add(movies);
            isFinished = state.movies.isEmpty;
          }
        },
        child: StreamBuilder<List<Movie>>(
            initialData: const [],
            stream: moviesStream.stream,
            builder: (context, snapshot) {
              return LoadMore(
                textBuilder: ConstMethods.loadMoreWordings,
                onLoadMore: () async {
                  page++;
                  moviesBloc.add(
                      SearchMovieEvent(controller.text, page.toString()));
                  return true;
                },
                isFinish: isFinished,
                whenEmptyLoad: false,
                delegate: CustomLoadMoreDelegate(),
                child: ListView.builder(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    itemCount: movies.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return searchTextField();
                      }
                      return getMovieView(movies[index - 1]);
                    }),
              );
            }),
      ),
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          errorStyle: TextStyle(
            fontSize: 11.0,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffA8A7A7)),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff3065AC), width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          hintText: 'Αναζήτηση',
        ),
        onSubmitted: (String value) {
          movies.clear();
          page = 1;
          moviesBloc.add(SearchMovieEvent(value, page.toString()));
        },
      ),
    );
  }

  Widget getMovieView(Movie movie) {
    return Column(
      children: [
        Text(
          "${movie.title}: ${movie.year}",
          style: const TextStyle(fontSize: StyleConstants.textFontSize),
        ),
        _imageBuilder(movie),
        const SizedBox(
          height: 10,
        ),
        _moreButton(movie),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _imageBuilder(Movie movie) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: _screenSize.width,
      height: _screenSize.height * 0.3,
      child: ImageBuilder(
        imageUrl: movie.poster,
      ),
    );
  }

  Widget _moreButton(Movie movie) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.pushNamed(context, Routes.singleMovieScreen,
            arguments: movie.imdbId);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text("Περισσότερα"),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
          )
        ],
      ),
    );
  }
}
