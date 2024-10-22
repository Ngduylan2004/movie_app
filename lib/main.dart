import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/data/repostory/movies_repostory_impl.dart';
import 'package:movie_app/presentation/home/bloc/home_bloc.dart';
import 'package:movie_app/presentation/search/bloc/search_bloc.dart';
import 'package:movie_app/presentation/sign_up/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the .env file
  await dotenv.load(fileName: ".env");

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeBloc()), // HomeBloc
      BlocProvider(
          create: (context) =>
              SearchBloc(MoviesRepositoryImpl.instance)), // SearchBloc
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    ),
  ));
}
