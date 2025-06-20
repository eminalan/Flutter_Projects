// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SonucEkran extends StatefulWidget {
  SonucEkran({super.key, required this.dogruSayisi});
  int dogruSayisi; // Doğru cevap sayısı
  @override
  State<SonucEkran> createState() => _SonucEkranState();
}

class _SonucEkranState extends State<SonucEkran> {
  // Başarı oranı yüzde olarak
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('sonuç ekranı')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "${widget.dogruSayisi} Doğru , ${5 - widget.dogruSayisi} Yanlış ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "%${(widget.dogruSayisi / 5 * 100).toInt()}  Başarı",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Sonuç ekranına yönlendirme
              },
              child: const Text('tekrar oyna'),
            ),
          ),
        ],
      ),
    );
  }
}
