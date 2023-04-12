import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/repository/repository.dart';
import 'package:starwars/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
          headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: Colors.yellow,
          ),
        ),
      ),
      home: RepositoryProvider(
        create: (context) => Repository(),
        child: const Splash(),
      ),
    );
  }
}
