// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:kisiler_uygulamasi_bloc/entity/kisiler.dart';
import 'package:kisiler_uygulamasi_bloc/sqlite/veritabani_yardimcisi.dart';

class KisilerdaoRepository {
  static Future<void> kisikayit(String kisi_ad, String kisi_tel) async {
    var db = await VeritabaniYardimcisi.connect();
    Map<String, dynamic> bilgiler = <String, dynamic>{};
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_tel"] = kisi_tel;
    await db.insert("kisiler", bilgiler);
  }

  static Future<void> kisiGuncelle(
    int kisi_id,
    String kisi_ad,
    String kisi_tel,
  ) async {
    var db = await VeritabaniYardimcisi.connect();
    Map<String, dynamic> bilgiler = <String, dynamic>{};
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_tel"] = kisi_tel;
    await db.update(
      "kisiler",
      bilgiler,
      where: "kisi_id=?",
      whereArgs: [kisi_id],
    );
  }

  static Future<List<Kisiler>> tumKisileriGoster() async {
    var db = await VeritabaniYardimcisi.connect();
    List<Map<String, Object?>> maps = await db.query("kisiler");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler.fromMap(satir);
    });
  }

  static Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.connect();
    List<Map<String, Object?>> maps = await db.query(
      "kisiler",
      where: "kisi_ad like'%$aramaKelimesi%'",
    );
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler.fromMap(satir);
    });
  }

  static Future<void> kisiSil(int kisi_id) async {
    var db = await VeritabaniYardimcisi.connect();
    db.delete("kisiler", where: "kisi_id=?", whereArgs: [kisi_id]);
  }
}
