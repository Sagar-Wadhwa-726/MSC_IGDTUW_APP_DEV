// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

TextFormField reuseableTextFormField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller, bool isUsername) {
  return TextFormField(
    textInputAction: TextInputAction.next,
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    style: TextStyle(color: Colors.black87.withOpacity(0.9)),
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      fillColor: Colors.white.withOpacity(0.3),
      filled: true,
      hintText: isUsername
          ? "Enter Username"
          : (isPasswordType ? "Enter Password" : "Enter Email"),
      prefixIcon: Icon(icon, color: Colors.black),
      labelText: text,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return isUsername
            ? "Please Enter a Username"
            : (isPasswordType
                ? "Please Enter a Password"
                : "Please Enter an Email");
      }
      return null;
    },
  );
}

SnackBar reusableSnackbar(String userContent) {
  return SnackBar(
    content: Text(
      userContent,
      style: TextStyle(color: Colors.white, fontSize: 14),
    ),
    showCloseIcon: true,
    backgroundColor: const Color.fromARGB(255, 43, 43, 43),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
