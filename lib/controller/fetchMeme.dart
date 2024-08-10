import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/reusable_widget.dart';
import 'package:http/http.dart';

class FetchMeme {
  static fetchMeme() async {
    final headers = {
      "X-Rapidapi-Key": "YOUR-RAPID-API-KEY-HERE",
      "X-Rapidapi-Host":
          "COPY- FROM CODE SNIPPETS, TARGET - HTTP FROM RAPID API WEBSITE",
      "Host": "COPY- FROM CODE SNIPPETS, TARGET - HTTP FROM RAPID API WEBSITE"
    };
    Response response = await get(
        // This is just Host parameter value, append "https://" at starting and "/v1/memes" at the end
        // Include http package in the pubspec.yaml dependencies to make the API call.
        Uri.parse("https://programming-memes-images.p.rapidapi.com/v1/memes"),
        headers: headers);
    // print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)[0]["image"];
    }
  }
}
