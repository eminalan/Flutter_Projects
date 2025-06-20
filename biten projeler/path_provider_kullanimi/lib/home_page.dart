import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController veri = TextEditingController();
  Future<void> veriYaz() async {
    var ad = await getApplicationDocumentsDirectory();
    String dosyaYolu = "${ad.path}/veri.txt";
    var dosya = File(dosyaYolu);
    await dosya.writeAsString(veri.text);
    veri.text = "";
  }

  Future<void> veriOku() async {
    try {
      var ad = await getApplicationDocumentsDirectory();
      String dosyaYolu = "${ad.path}/veri.txt";
      var dosya = File(dosyaYolu);
      String okunanVeri = await dosya.readAsString();
      veri.text = okunanVeri;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> veriSil() async {
    var ad = await getApplicationDocumentsDirectory();
    String dosyaYolu = "${ad.path}/veri.txt";
    var dosya = File(dosyaYolu);
    if (dosya.existsSync()) {
      await dosya.delete();
    } else {
      if (kDebugMode) {
        print("Dosya bulunamadı");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anasayfa')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: veri,
              decoration: InputDecoration(
                labelText: "veri girin",
                hintText: "veri girin",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    veriYaz();
                  },
                  child: const Text("yaz"),
                ),
                ElevatedButton(
                  onPressed: () {
                    veriOku();
                  },
                  child: const Text("oku"),
                ),
                ElevatedButton(
                  onPressed: () {
                    veriSil();
                  },
                  child: const Text("sil"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
