import 'package:movie_app/models/listMovie/moives_model.dart';

class PageBaseResult {
  int? page;
  List<Moives>? moives;
  int? totalPages;
  int? totalResults;

  PageBaseResult({this.page, this.moives, this.totalPages, this.totalResults});

  PageBaseResult.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['moives'] != null) {
      moives = <Moives>[];
      json['moives'].forEach((v) {
        moives!.add(Moives.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (moives != null) {
      data['moives'] = moives!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
