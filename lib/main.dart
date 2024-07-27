// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

/* FORMAT ON SAVE, AUTO SAVE, PREVIEW UI */

// this is used for importing packages, theme, widgets related to android, which follows google's standart design policy
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';

// entry point in the application
void main() {
  // runApp is called which calls MyApp()
  playGame(score: 12, gameName: "SpiderMan");
  runApp(MyApp());
}

void playGame({required int score, String? gameName}) {
  print("Player score is $score and game name is $gameName");
}

class MyApp extends StatelessWidget {
  // used if we are passing any data to the app
  const MyApp({super.key});

  // the build method is called which builds the whole app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // primaryTextTheme: GoogleFonts.latoTextTheme(), applied only on primary text
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      home: LoginPage(),
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
