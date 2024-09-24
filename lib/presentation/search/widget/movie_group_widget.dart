import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/presentation/search/widget/movie_item_large_widget%20.dart';

class MovieGroupWidget extends StatelessWidget {
  final List<MovieModel> listMovie;
  const MovieGroupWidget({super.key, required this.listMovie});

  @override
  Widget build(BuildContext context) {
    if (listMovie.length == 1) {
      return Align(
        alignment: Alignment.centerLeft,
        child: MovieItemLargeWidget(
          isLarge: true,
          image: listMovie[0].image,
          name: listMovie[0].name,
        ),
      );
    }
    if (listMovie.length == 2) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start, //đẩy
        children: [
          MovieItemLargeWidget(
            isLarge: true,
            image: listMovie[0].image,
            name: listMovie[0].name,
          ),
          MovieItemLargeWidget(
            isLarge: false,
            image: listMovie[1].image,
            name: listMovie[1].name,
          ),
        ],
      );
    }
    if (listMovie.length == 3) {
      return SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          height: 545,
          child: Wrap(
              direction: Axis.vertical,
              spacing: 16, // khoảng cách giữa các chip
              runSpacing: 16, // khoảng cách giữa các dòng
              children: <Widget>[
                MovieItemLargeWidget(
                  isLarge: true,
                  image: listMovie[0].image,
                  name: listMovie[0].name,
                ),
                MovieItemLargeWidget(
                  isLarge: false,
                  image: listMovie[1].image,
                  name: listMovie[1].name,
                ),
                MovieItemLargeWidget(
                  isLarge: false,
                  image: listMovie[2].image,
                  name: listMovie[2].name,
                )
              ]));
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      height: 545,
      child: Wrap(
        alignment: WrapAlignment.end,
        direction: Axis.vertical,
        spacing: 16, // khoảng cách giữa các chip
        runSpacing: 16, // khoảng cách giữa các dòng
        children: <Widget>[
          MovieItemLargeWidget(
            isLarge: true,
            image: listMovie[0].image,
            name: listMovie[0].name,
          ),
          MovieItemLargeWidget(
            isLarge: false,
            image: listMovie[1].image,
            name: listMovie[1].name,
          ),
          MovieItemLargeWidget(
            isLarge: false,
            image: listMovie[2].image,
            name: listMovie[2].name,
          ),
          MovieItemLargeWidget(
            isLarge: true,
            image: listMovie[3].image,
            name: listMovie[3].name,
          ),
        ],
      ),
    );
  }
}
