import 'package:flutter_application/models/kelime.dart';
import 'package:flutter_application/services/SQL/sql_db_helper.dart';
import 'package:sqflite/sqlite_api.dart';

class Crud {
  Database? db;
  Future<List<Kelime>> readKelime() async {
    List<Kelime> kelimelerList = [];
    db = await SqlDBHelper.connect();
    List<Map<String, dynamic>> kelimeler = await db!.query(Tables.tblkelime);

    for (var i = 0; i < kelimeler.length; i++) {
      Map<String, dynamic> kelime = kelimeler[i];
      kelimelerList.add(Kelime.fromMap(kelime));
    }
    await Future.delayed(const Duration(seconds: 2));
    return kelimelerList;
  }

  Future<int> createKelime(Kelime kisi) async {
    db = await SqlDBHelper.connect();
    int kaydedilenID = await db!.insert(Tables.tblkelime, kisi.toMap());

    return kaydedilenID;
  }

  Future<int> deleteKelime(Kelime kisi) async {
    db = await SqlDBHelper.connect();
    int silinenSatirSayisi = await db!.delete(
      Tables.tblkelime,
      where: "id=?",
      whereArgs: [kisi.id],
    );
    return silinenSatirSayisi;
  }

  Future<int> updateKelime(Kelime kisi) async {
    db = await SqlDBHelper.connect();
    int silinenSatirSayisi = await db!.update(
      Tables.tblkelime,
      kisi.toMap(),
      where: "id=?",
      whereArgs: [kisi.id],
    );
    return silinenSatirSayisi;
  }
}

abstract class Tables {
  static final String tblkelime = "kelimeler";
}
