import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/movie_api_service.dart';
import 'package:toonflix/widgets/movie_widget.dart';

class MovieHomeScreen extends StatelessWidget {
  MovieHomeScreen({super.key});

  final Future<List<MovieModel>> movies = MovieApiService.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          title: const Text(
            "",
          )),
      body: FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Popular Movies',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child: makeMovieList(snapshot)),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        print(index);
        var movie = snapshot.data![index];
        return Movie(
          title: movie.title,
          backdrop: movie.backdrop,
          poster: movie.poster,
          vote: movie.vote,
          overview: movie.overview,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 13,
      ),
    );
  }
}
