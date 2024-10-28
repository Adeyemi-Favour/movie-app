import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

void main () => runApp(movieApp());

class movieApp extends StatelessWidget {
  const movieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
              titleTextStyle: TextStyle(color: Colors.white)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
      ),
      home: homePage(),
    );
  }
}
