// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously, sort_child_properties_last
// whenever a folder added, the app should be restarted instead of just hot reloading

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/reusable_widget.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String text = "";
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();

  // Text Editing controllers
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  moveToHomePage(context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changedButton = true;
      });

      await Future.delayed(Duration(seconds: 3));
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailTextController.text,
              password: _passwordTextController.text)
          .then((value) {
        Navigator.pushNamed(context, MyRoutes.homeRoute);
        ScaffoldMessenger.of(context).showSnackBar(reusableSnackbar(
            "Welcome ${FirebaseAuth.instance.currentUser?.email}"));
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              SizedBox(height: 20.0),
              Text(
                "Welcome $text",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.yujiHentaiganaAkebono().fontFamily,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: <Widget>[
                    reuseableTextFormField("Enter Email", Icons.email, false,
                        _emailTextController, true),
                    SizedBox(height: 20),
                    reuseableTextFormField("Enter Password", Icons.password,
                        true, _passwordTextController, false),
                    // TextFormField(
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Please Enter a Username";
                    //     }
                    //     return null;
                    //   },
                    //   onChanged: (content) {
                    //     setState(() {
                    //       text = content;
                    //     });
                    //   },
                    //   decoration: InputDecoration(
                    //       hintText: "Enter Username", labelText: "Username"),
                    // ),
                    // TextFormField(
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Please Enter a Password";
                    //     }
                    //     if (value.length < 6) {
                    //       return "Password length can't be less than 6";
                    //     }
                    //     return null;
                    //   },
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //       hintText: "Enter Password", labelText: "Password"),
                    // ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          child: Text("Forgot Password ?"),
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRoutes.resetPasswordRoute);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => moveToHomePage(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changedButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changedButton
                                ? Icon(Icons.done)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(
                                    changedButton ? 50 : 8)),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, MyRoutes.signUpRoute),
                          child: Container(
                            width: 150,
                            height: 50,
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // ElevatedButton(
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(150, 40),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("Login"),
                    // ),
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
