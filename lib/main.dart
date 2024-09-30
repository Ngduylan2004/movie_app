import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/presentation/home/bloc/home_bloc.dart';
import 'package:movie_app/presentation/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Tải file .env
  await dotenv.load(fileName: ".env");

  runApp(BlocProvider(
    create: (context) => HomeBloc(),
    child: MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    ),
  ));
}
