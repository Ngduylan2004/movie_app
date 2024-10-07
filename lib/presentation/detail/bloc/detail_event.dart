part of 'detail_bloc.dart';

abstract class DetailEvent {}

class DetailEventRelateMovies extends DetailEvent {
  final int genreId; // Sửa lại để sử dụng genreId

  DetailEventRelateMovies(this.genreId);
}
