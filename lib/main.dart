import 'package:flutter/material.dart';
import 'package:movie_app/presentation/search/searching_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.black),
    home: const SearchingScreen(),
  ));
}
