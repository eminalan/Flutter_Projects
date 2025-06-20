import 'package:flutter/material.dart';
import 'package:flutter_konum_kullanimi/pages/harita_acma.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HaritaAcma());
  }
}
