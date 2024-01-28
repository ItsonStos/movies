import 'package:flutter/material.dart';
import 'package:bilheteria_panucci/screens/movie_screen.dart';

import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieScreen(movie: movie),
                        ),
                      );
                    },
                    child: movie.imageURI != null
                        ? Ink(
                            width: double.infinity,
                            child: Image.network(
                              movie.imageURI!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Ink(
                                  child: const Center(
                                  child: Icon(Icons.error),
                                ),);
                              },
                            ),
                          )
                        : Ink(
                            child: const Center(
                              child: Icon(Icons.error),
                            ),
                          )
              )),
        ),
        Text(
          movie.name,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
