// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDBHelper {
  SqlDBHelper._privateConstructor();

  static final SqlDBHelper _nesne = SqlDBHelper._privateConstructor();

  factory SqlDBHelper() {
    return _nesne;
  }

  static const _dbName = "database.db";
  static Future<Database> connect() async {
    String dbPath = join(await getDatabasesPath(), _dbName);
    if (await databaseExists(dbPath)) {
      print("Veritabanı var");
    } else {
      ByteData data = await rootBundle.load("lib/veritabani/$_dbName");
      List<int> bytes = data.buffer.asInt8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(dbPath).writeAsBytes(bytes, flush: true);
      print("Veritabanı kopyalandı");
    }
    return openDatabase(dbPath);
  }
}
