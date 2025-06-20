import 'package:flutter/material.dart';
import 'package:flutter_http_kullanimi/core/theme/costum_theme.dart';
import 'package:flutter_http_kullanimi/pages/nutrition_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,

      home: NutritionPage(),
    );
  }
}
