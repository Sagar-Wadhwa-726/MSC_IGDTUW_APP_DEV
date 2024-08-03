// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously, sort_child_properties_last, prefer_final_fields, non_constant_identifier_names, unnecessary_new
// whenever a folder added, the app should be restarted instead of just hot reloading
import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/reusable_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ResetPasswordUsingFirebase(context) async {
    if (_formKey.currentState?.validate() ?? false) {}
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
              Image.asset("assets/images/reset_password.png"),
              SizedBox(height: 20.0),
              Text(
                "Reset Password",
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
                    reuseableTextFormField("Email", Icons.email, false,
                        _emailTextController, false),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () => ResetPasswordUsingFirebase(context),
                      child: Container(
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        child: Text(
                          "Reset Password",
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
