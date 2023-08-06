import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final String title, backdrop, poster, overview;
  final num vote;

  const MovieDetailScreen({
    super.key,
    required this.title,
    required this.backdrop,
    required this.poster,
    required this.vote,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          foregroundColor: Colors.black,
          title: const Text(
            "Back to list",
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: backdrop,
              child: Container(
                width: 430,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(0.1, 0.1),
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/$poster',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 50, 60),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "평점 $vote",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Storyline",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          overview,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 50,
                          ),
                          child: Text(
                            'Buy Ticket',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
