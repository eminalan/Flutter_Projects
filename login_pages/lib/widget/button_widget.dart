// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:vb10/style/button_style.dart';

class ButtonWidget {
  static final String facebok_url =
      "https://cdn-icons-png.freepik.com/256/15707/15707737.png?semt=ais_hybrid";
  static final String google_url =
      "https://cdn-icons-png.flaticon.com/512/300/300221.png";
  static final String apple_url =
      "https://cdn-icons-png.flaticon.com/256/0/747.png";
  static final double icon_size = 20.0;
}

ElevatedButton log_in_button(String text) {
  return ElevatedButton(
    style: log_in_btn_style(),
    onPressed: () {
      print("Log in button pressed");
    },
    child: Text(text),
  );
}

ElevatedButton google_login(String text) {
  return ElevatedButton.icon(
    style: google_style(),
    onPressed: () {
        print("Google login button pressed");
    },
    icon: Image.network(
      ButtonWidget.google_url,
      height: ButtonWidget.icon_size,
    ),
    label: Text(text),
  );
}

ElevatedButton facebook_login(String text) {
  return ElevatedButton.icon(
    style: facebook_style(),
    onPressed: () {
        print("Facebook login button pressed");
    },
    icon: Image.network(
      ButtonWidget.facebok_url,
      height: ButtonWidget.icon_size,
    ),
    label: Text(text),
  );
}

ElevatedButton apple_login(String text) {
  return ElevatedButton.icon(
    style: apple_style(),
    onPressed: () {
        print("Apple login button pressed");
    },
    icon: Image.network(
      color: Colors.white,
      ButtonWidget.apple_url,
      height: ButtonWidget.icon_size,
    ),
    label: Text(text),
  );
}
