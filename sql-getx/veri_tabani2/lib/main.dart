// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'veritabani_yardimcisi.dart';
import 'gorev_formu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Görev Yönetimi',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GorevListesi(),
    );
  }
}

class GorevListesi extends StatefulWidget {
  @override
  _GorevListesiDurum createState() => _GorevListesiDurum();
}

class _GorevListesiDurum extends State<GorevListesi> {
 final VeritabaniYardimcisi _veritabaniYardimcisi = VeritabaniYardimcisi.yardimci;
  List<Map<String, dynamic>> _gorevler = [];
  String _filtre = 'Tümü'; // Tümü, Tamamlandı, Tamamlanmadı

  @override
  void initState() {
    super.initState();
    _gorevleriGetir();
  }

  Future<void> _gorevleriGetir() async {
    final veri = await _veritabaniYardimcisi.gorevleriGetir(filtre: _filtre);
    setState(() {
      _gorevler = veri;
    });
  }

  void _gorevSil(int id) async {
    await _veritabaniYardimcisi.gorevSil(id);
    _gorevleriGetir();
  }

  void _durumDegistir(int id, bool tamamlandiMi) async {
    await _veritabaniYardimcisi.gorevGuncelle({
      'id': id,
      'tamamlandiMi': tamamlandiMi ? 0 : 1,
    });
    _gorevleriGetir();
  }

  void _gorevFormuAc({Map<String, dynamic>? gorev}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GorevFormu(
          gorev: gorev,
          kaydedildi: _gorevleriGetir,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Görevler'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (deger) {
              setState(() {
                _filtre = deger;
              });
              _gorevleriGetir();
            },
            itemBuilder: (_) => ['Tümü', 'Tamamlandı', 'Tamamlanmadı']
                .map((filtre) => PopupMenuItem(
                      value: filtre,
                      child: Text(filtre),
                    ))
                .toList(),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, kisitlamalar) {
          return _gorevler.isEmpty
              ? Center(child: Text('Henüz bir görev eklenmedi.'))
              : ListView.builder(
                  itemCount: _gorevler.length,
                  itemBuilder: (context, index) {
                    final gorev = _gorevler[index];
                    return ListTile(
                      title: Text(
                        gorev['baslik'],
                        style: TextStyle(
                          decoration: gorev['tamamlandiMi'] == 1
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      subtitle: Text(gorev['kategori'] ?? 'Genel'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.check,
                              color: gorev['tamamlandiMi'] == 1
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            onPressed: () =>
                                _durumDegistir(gorev['id'], gorev['tamamlandiMi'] == 1),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _gorevFormuAc(gorev: gorev),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _gorevSil(gorev['id']),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _gorevFormuAc(),
      ),
    );
  }
}
