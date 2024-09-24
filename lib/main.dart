import 'package:flutter/material.dart';
import 'package:movie_app/presentation/home/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.black),
    debugShowCheckedModeBanner: false,
    home: const HomeScreen(),
  ));
}
