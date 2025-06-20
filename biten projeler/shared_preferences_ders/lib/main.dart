// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_ders/anasayfa.dart';
import 'package:shared_preferences_ders/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<bool> oturumBilgisiOku() async {
    var sp = await SharedPreferences.getInstance();

    String username = sp.getString("username") ?? "Kullanıcı adı bulunamadı";
    String password = sp.getString("password") ?? "Şifre bulunamadı";
    if (username == "admin" && password == "12345") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FutureBuilder<bool>(
        future: oturumBilgisiOku(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data == true ? const Anasayfa() : const Login();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int sayac = 0;
  @override
  void initState() {
    super.initState();
    artir();
  }

  Future<void> artir() async {
    var sp = await SharedPreferences.getInstance();
    sayac = sp.getInt("sayac") ?? 0;
    setState(() {
      sayac++;
    });
    await sp.setInt("sayac", sayac);
    print("Sayac: $sayac");
  }

  Future<void> azalt() async {
    var sp = await SharedPreferences.getInstance();

    sayac = sp.getInt("sayac") ?? 0;

    setState(() {
      sayac = 0;
    });
    await sp.setInt("sayac", sayac);
    print("Sayac: $sayac");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(sayac.toString(), style: const TextStyle(fontSize: 30)),
            TextButton(
              onPressed: () {
                artir();
              },
              child: const Text('artır'),
            ),
            TextButton(
              onPressed: () {
                azalt();
              },
              child: const Text('azalt'),
            ),
          ],
        ),
      ),
    );
  }
}
