import 'package:flutter/material.dart';

ThemeData ThemData1() {
  return ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
      ),
      titleMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
