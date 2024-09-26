import 'package:flutter/material.dart';
import 'package:movie_app/models/listMovie/moives_model.dart';
import 'package:movie_app/presentation/search/widget/movie_item_large_widget%20.dart';

class MovieGroupWidget extends StatelessWidget {
  final List<Moives> listMovie;

  const MovieGroupWidget({super.key, required this.listMovie});

  @override
  Widget build(BuildContext context) {
    // Determine the layout based on the number of movies in the list
    switch (listMovie.length) {
      case 1:
        return Align(
          alignment: Alignment.centerLeft,
          child: MovieItemLargeWidget(
            isLarge: true,
            image: listMovie[0].backdropPath ?? '',
            name: listMovie[0].title ?? 'Untitled',
          ),
        );

      case 2:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listMovie.map((movie) {
            return MovieItemLargeWidget(
              isLarge: listMovie.indexOf(movie) == 0,
              image: movie.backdropPath ?? '',
              name: movie.title ?? 'Untitled',
            );
          }).toList(),
        );

      case 3:
        return SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          height: 545,
          child: Wrap(
            direction: Axis.vertical,
            spacing: 16,
            children: listMovie.map((movie) {
              return MovieItemLargeWidget(
                isLarge: listMovie.indexOf(movie) == 0,
                image: movie.backdropPath ?? '',
                name: movie.title ?? 'Untitled',
              );
            }).toList(),
          ),
        );

      default:
        return SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          height: 545,
          child: Wrap(
            alignment: WrapAlignment.end,
            direction: Axis.vertical,
            spacing: 16,
            children: listMovie.map((movie) {
              return MovieItemLargeWidget(
                isLarge: listMovie.indexOf(movie) == 0 ||
                    listMovie.indexOf(movie) == 3,
                image: movie.backdropPath ?? '',
                name: movie.title ?? 'Untitled',
              );
            }).toList(),
          ),
        );
    }
  }
}
