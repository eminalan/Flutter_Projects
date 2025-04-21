// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:vb10/style/button_style.dart';

Text login_to_spotfiy_text() {
    return const Text(
      "Log in to Spotify",
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text forgot_your_password_text() {
    return Text("Forgot Your Password?", style: text_style());
  }