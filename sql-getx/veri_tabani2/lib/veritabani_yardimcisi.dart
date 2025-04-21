import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class VeritabaniYardimcisi {
  static final VeritabaniYardimcisi yardimci = VeritabaniYardimcisi._ic();
  static Database? _veritabani;

  VeritabaniYardimcisi._ic();

  Future<Database> get veritabani async {
    if (_veritabani != null) return _veritabani!;
    _veritabani = await _veritabaniOlustur();
    return _veritabani!;
  }

  Future<Database> _veritabaniOlustur() async {
    String yol = join(await getDatabasesPath(), 'gorevler.db');
    return await openDatabase(
      yol,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE gorevler (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            baslik TEXT NOT NULL,
            kategori TEXT,
            tamamlandiMi INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> gorevleriGetir({String filtre = 'Tümü'}) async {
    final db = await veritabani;
    String kosul = '';

    if (filtre == 'Tamamlandı') {
      kosul = 'WHERE tamamlandiMi = 1';
    } else if (filtre == 'Tamamlanmadı') {
      kosul = 'WHERE tamamlandiMi = 0';
    }

    return await db.rawQuery('SELECT * FROM gorevler $kosul');
  }

  Future<int> gorevEkle(Map<String, dynamic> gorev) async {
    final db = await veritabani;
    return await db.insert('gorevler', gorev);
  }

  Future<int> gorevGuncelle(Map<String, dynamic> gorev) async {
    final db = await veritabani;
    return await db.update(
      'gorevler',
      gorev,
      where: 'id = ?',
      whereArgs: [gorev['id']],
    );
  }

  Future<int> gorevSil(int id) async {
    final db = await veritabani;
    return await db.delete('gorevler', where: 'id = ?', whereArgs: [id]);
  }
}
