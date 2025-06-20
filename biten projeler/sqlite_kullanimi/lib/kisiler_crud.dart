import 'package:sqflite/sqflite.dart';
import 'package:sqlite_kullanimi/kisiler.dart';
import 'package:sqlite_kullanimi/veritabani_yardimcisi.dart';

class KisilerCrud {
  Future<List<Kisiler>> tumKisiler() async {
    Database db = await VeritabaniYardimcisi().database;
    List<Map<String, dynamic>> maps = await db.query('kisiler');
    return List.generate(maps.length, (i) {
      Map<String, dynamic> satir = maps[i];
      return Kisiler.fromMap(satir);
    });

  }
  Future<int> kisiEkle(Kisiler kisi) async {
    Database db = await VeritabaniYardimcisi().database;
    return await db.insert('kisiler', kisi.toMap());
  }
  Future<int> kisiGuncelle(Kisiler kisi) async {
    Database db = await VeritabaniYardimcisi().database;
    return await db.update(
      'kisiler',
      kisi.toMap(),
      where: 'kisi_id = ?',
      whereArgs: [kisi.kisi_id],
    );
  }
  Future<int> kisiSil(int kisiId) async {
    Database db = await VeritabaniYardimcisi().database;
    return await db.delete(
      'kisiler',
      where: 'kisi_id = ?',
      whereArgs: [kisiId],
    );
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    Database db = await VeritabaniYardimcisi().database;
    List<Map<String, dynamic>> maps = await db.query(
      'kisiler',
      where: 'kisi_ad LIKE ?',
      whereArgs: ['%$aramaKelimesi%'],
    );
    return List.generate(maps.length, (i) {
      Map<String, dynamic> satir = maps[i];
      return Kisiler.fromMap(satir);
    });
  }
}
