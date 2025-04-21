import 'package:sqflite/sqlite_api.dart';
import 'package:sqflitedeneme/models/model_kisi.dart';

import 'sql_db_helper.dart';

class Crud {
  Database? db;
  Future<List<ModelKisi>> readKisiler() async {
    List<ModelKisi> kisilerList = [];
    db = await SqlDBHelper.connect();
    List<Map<String, dynamic>> kisiler = await db!.query(
      "kisiler",
      orderBy: "ad",
    );

    for (var i = 0; i < kisiler.length; i++) {
      Map<String, dynamic> kisi = kisiler[i];
      kisilerList.add(ModelKisi.fromMap(kisi));
    }
    await Future.delayed(const Duration(seconds: 2));
    return kisilerList;
  }

  Future<int> createKisiler(ModelKisi kisi) async {
    db = await SqlDBHelper.connect();
    int kaydedilenID = await db!.insert("kisiler", kisi.toMap());

    return kaydedilenID;
  }

  Future<int> deleteKisiler(ModelKisi kisi) async {
    db = await SqlDBHelper.connect();
    int silinenSatirSayisi = await db!.delete(
      Tables.tblKisi,
      where: "id_kisi=?",
      whereArgs: [kisi.id_kisi],
    );
    return silinenSatirSayisi;
  }

  Future<int> updateKisiler(ModelKisi kisi) async {
    db = await SqlDBHelper.connect();
    int silinenSatirSayisi = await db!.update(
      Tables.tblKisi,
      kisi.toMap(),
      where: "id_kisi=?",
      whereArgs: [kisi.id_kisi],
    );
    return silinenSatirSayisi;
  }
}

abstract class Tables {
  static final String tblKisi = "kisiler";
}
