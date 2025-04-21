// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'veritabani_yardimcisi.dart';

class GorevFormu extends StatelessWidget {
  final Map<String, dynamic>? gorev;
  final VoidCallback kaydedildi;

  GorevFormu({this.gorev, required this.kaydedildi});

  final TextEditingController _baslikDenetleyici = TextEditingController();
  final TextEditingController _kategoriDenetleyici = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (gorev != null) {
      _baslikDenetleyici.text = gorev!['baslik'];
      _kategoriDenetleyici.text = gorev!['kategori'] ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(gorev == null ? 'Görev Ekle' : 'Görev Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _baslikDenetleyici,
              decoration: InputDecoration(labelText: 'Görev Başlığı'),
            ),
            TextField(
              controller: _kategoriDenetleyici,
              decoration: InputDecoration(labelText: 'Kategori (Opsiyonel)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(gorev == null ? 'Ekle' : 'Güncelle'),
              onPressed: () async {
                final gorevVerisi = {
                  'baslik': _baslikDenetleyici.text,
                  'kategori': _kategoriDenetleyici.text,
                  'tamamlandiMi': gorev?['tamamlandiMi'] ?? 0,
                  'id': gorev?['id'],
                };
                if (gorev == null) {
                  await VeritabaniYardimcisi.yardimci.gorevEkle(gorevVerisi);
                } else {
                  await VeritabaniYardimcisi.yardimci.gorevGuncelle(gorevVerisi);
                }
                kaydedildi();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
