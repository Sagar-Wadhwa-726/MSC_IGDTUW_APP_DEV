// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously, sort_child_properties_last, prefer_final_fields
// whenever a folder added, the app should be restarted instead of just hot reloading

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/reusable_widget.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  signUpUsingFirebase(context) async {
    if (_formKey.currentState?.validate() ?? false) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailTextController.text,
              password: _passwordTextController.text)
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(reusableSnackbar("User Creation Successful"));
        Navigator.pushNamed(context, MyRoutes.loginRoute);
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context)
            .showSnackBar(reusableSnackbar("Error $error"));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/login_image.png"),
              SizedBox(height: 20.0),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.yujiHentaiganaAkebono().fontFamily,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: <Widget>[
                    reuseableTextFormField(
                        "Username",
                        Icons.supervised_user_circle_rounded,
                        false,
                        _userNameTextController,
                        true),
                    SizedBox(height: 30),
                    reuseableTextFormField("Email", Icons.email, false,
                        _emailTextController, false),
                    SizedBox(height: 30),
                    reuseableTextFormField("Password", Icons.password, true,
                        _passwordTextController, false),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () => signUpUsingFirebase(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1, milliseconds: 500),
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
