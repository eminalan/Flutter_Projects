import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_forefin_kullanimi/filmler_crud.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> goster() async {
    var list = await FilmlerCrud().tumFilmler();
    for (var e in list) {
      if (kDebugMode) {
        print("**************************");
        print("${e.film_id}, ${e.film_ad}, ${e.film_yil}, ${e.film_resim},");
        print("**************************");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    goster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Title')), body: Center());
  }
}
