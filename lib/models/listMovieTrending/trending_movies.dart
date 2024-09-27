import 'package:movie_app/models/listMovieTrending/list_movie_treding.dart';

class TrendingMovies {
  int? page;
  List<ListMovieTrending>? listMovieTrending;
  int? totalPages;
  int? totalResults;

  TrendingMovies(
      {this.page, this.listMovieTrending, this.totalPages, this.totalResults});

  TrendingMovies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['listMovieTrending'] != null) {
      listMovieTrending = <ListMovieTrending>[];
      json['listMovieTrending'].forEach((v) {
        listMovieTrending!.add(ListMovieTrending.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (listMovieTrending != null) {
      data['listMovieTrending'] =
          listMovieTrending!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
