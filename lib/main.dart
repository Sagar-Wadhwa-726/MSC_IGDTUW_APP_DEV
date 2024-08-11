// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

/* FORMAT ON SAVE, AUTO SAVE, PREVIEW UI */

// this is used for importing packages, theme, widgets related to android, which follows google's standart design policy
// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/pages/reset_password.dart';
import 'package:flutter_catalog/pages/shopping.dart';
import 'package:flutter_catalog/pages/sign_up.dart';
import 'package:flutter_catalog/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB0h8vLGRyvWMCCrosjRWYFAlC7sPcchqs",
          appId: "1:927354775405:android:4da946fccea16d07e1dc64",
          messagingSenderId: "927354775405",
          projectId: "mscusersignin"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // used if we are passing any data to the app
  const MyApp({super.key});

  // the build method is called which builds the whole app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        MyRoutes.resetPasswordRoute: (context) => ResetPassword(),
        MyRoutes.signUpRoute: (context) => SignUp(),
        MyRoutes.shopRoute: (context) => ShoppingPage(),
      },
    );
  }
}
