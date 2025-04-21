import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class VeritabaniYardimcisi {
  static final VeritabaniYardimcisi _yardimci = VeritabaniYardimcisi._ic();

  factory VeritabaniYardimcisi() {
    return _yardimci;
  }

  VeritabaniYardimcisi._ic();

  static Database? _veritabani;

  Future<Database> get veritabani async {
    if (_veritabani != null) return _veritabani!;
    _veritabani = await _veritabaniOlustur();

    return _veritabani!;
  }

  Future<Database> _veritabaniOlustur() async {
    String yol = join(await getDatabasesPath(), 'urunler.db');
    return await openDatabase(
      yol,
      version: 1,
      onCreate: _olustur,
    );
  }

  Future<void> _olustur(Database db, int versiyon) async {
    await db.execute('''
      CREATE TABLE urunler (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        isim TEXT NOT NULL,
      )
    ''');
  }

  Future<int> urunEkle(Map<String, dynamic> urun) async {
    Database db = await veritabani;
    return await db.insert('urunler', urun);
  }

  Future<List<Map<String, dynamic>>> urunleriGetir() async {
    Database db = await veritabani;
    return await db.query('urunler');
  }

  Future<int> urunGuncelle(Map<String, dynamic> urun) async {
    Database db = await veritabani;
    return await db.update(
      'urunler',
      urun,
      where: 'id = ?',
      whereArgs: [urun['id']],
    );
  }

  Future<int> urunSil(int id) async {
    Database db = await veritabani;
    return await db.delete(
      'urunler',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
