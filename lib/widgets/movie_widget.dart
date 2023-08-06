import 'package:flutter/material.dart';
import 'package:toonflix/screens/movie_detail_screen.dart';

class Movie extends StatelessWidget {
  final String title, backdrop, poster, overview;
  final num vote;

  const Movie({
    super.key,
    required this.title,
    required this.backdrop,
    required this.poster,
    required this.vote,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: false,
                builder: (context) => MovieDetailScreen(
                      title: title,
                      backdrop: backdrop,
                      poster: poster,
                      vote: vote,
                      overview: overview,
                    )));
      },
      child: Column(
        children: [
          Hero(
            tag: backdrop,
            child: Container(
              width: 370,
              height: 210,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(0.1, 0.1),
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ]),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/$backdrop',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
