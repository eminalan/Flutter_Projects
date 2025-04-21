
// ignore_for_file: non_constant_identifier_names

  import 'package:flutter/material.dart';

ButtonStyle log_in_btn_style() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color.fromRGBO(30, 209, 103, 1),
      foregroundColor: Color.fromRGBO(20, 20, 20, 1),
      fixedSize: const Size(300, 40),
      elevation: 5,
      shadowColor: const Color.fromRGBO(30, 209, 103, 1),
      side: const BorderSide(color: Color.fromRGBO(30, 209, 103, 1), width: 2),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }

  ButtonStyle google_style() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
      foregroundColor: Colors.white,
      fixedSize: const Size(300, 40),
      elevation: 5,
      side: const BorderSide(color: Colors.white, width: 1),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }

  ButtonStyle facebook_style() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
      foregroundColor: Colors.white,
      fixedSize: const Size(300, 40),
      elevation: 5,
      side: const BorderSide(color: Colors.white, width: 1),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }

  ButtonStyle apple_style() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
      foregroundColor: Colors.white,
      fixedSize: const Size(300, 40),
      elevation: 5,
      side: const BorderSide(color: Colors.white, width: 1),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
    TextStyle text_style() {
    return TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }