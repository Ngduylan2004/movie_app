import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/home/bloc/home_bloc.dart';
import 'package:movie_app/presentation/home/home_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => HomeBloc(),
    child: MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    ),
  ));
}
