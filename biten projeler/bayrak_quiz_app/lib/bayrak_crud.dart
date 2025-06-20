// ignore_for_file: non_constant_identifier_names

import 'package:bayrak_quiz_app/database_helper.dart';
import 'package:bayrak_quiz_app/model/bayrak_model.dart';
import 'package:sqflite/sqflite.dart';

class BayrakCrud {
  Future<List<BayrakModel>> rastgele5Getir() async {
  Database db = await VeritabaniYardimcisi.veritabaniErisim();
  List<Map<String, dynamic>> bayraklar = await db.rawQuery(
    "SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5",
  );

  List<BayrakModel> bayrakListesi = [];
  for (Map<String, dynamic> bayrak in bayraklar) {
    bayrakListesi.add(BayrakModel.fromMap(bayrak));
  }
  return bayrakListesi;
}

Future<List<BayrakModel>> rastgele3YanlisGetir(int bayrak_id) async {
  Database db = await VeritabaniYardimcisi.veritabaniErisim();
  List<Map<String, dynamic>> bayraklar = await db.rawQuery(
    "SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id ORDER BY RANDOM() LIMIT 5",
  );

  List<BayrakModel> bayrakListesi = [];
  for (Map<String, dynamic> bayrak in bayraklar) {
    bayrakListesi.add(BayrakModel.fromMap(bayrak));
  }
  return bayrakListesi;
}

}