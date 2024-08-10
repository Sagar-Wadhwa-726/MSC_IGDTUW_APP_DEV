import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/reusable_widget.dart';
import 'package:http/http.dart';

class FetchMeme {
  static fetchMeme(context) async {
    final headers = {
      "X-Rapidapi-Key": "c47ada7d91msh401c2c7de32c1eap1de417jsn79a4dfc2b71a",
      "X-Rapidapi-Host": "programming-memes-images.p.rapidapi.com",
      "Host": "programming-memes-images.p.rapidapi.com"
    };
    Response response = await get(
        // This is just Host parameter value, append "https://" at starting and "/v1/memes" at the end
        // Include http package in the pubspec.yaml dependencies to make the API call.
        Uri.parse("https://programming-memes-images.p.rapidapi.com/v1/memes"),
        headers: headers);
    // print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)[0]["image"];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(reusableSnackbar(
          'Error! Status Code : ${response.statusCode}, ${jsonDecode(response.body)["message"]}'));
      return "https://uxwing.com/wp-content/themes/uxwing/download/video-photography-multimedia/error-image-photo-icon.png";
    }
  }
}
