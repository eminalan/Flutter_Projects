import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_kullanimi/kisiler.dart';
import 'package:sqlite_kullanimi/veritabani_yardimcisi.dart';

import 'kisiler_crud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await VeritabaniYardimcisi().database; // Veritabanını başlat

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> kisileriGoster() async {
    List<Kisiler> liste = await KisilerCrud().tumKisiler();
    for (Kisiler kisi in liste) {
      if (kDebugMode) {
        print("ID: ${kisi.kisi_id}, Ad: ${kisi.kisi_id}, Yaş: ${kisi.kisi_ad}");
      }
    }
  }

  Future<void> ekle() async {
    Kisiler kisi = Kisiler(kisi_ad: "eminaaa", kisi_yas: 30);
   
  }

  @override
  void initState() {
    super.initState();
      ekle();
    kisileriGoster();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: Text("SQLite Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
