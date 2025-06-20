// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class VeritabaniYardimcisi {
  VeritabaniYardimcisi._privateConstructor();

  static final VeritabaniYardimcisi _nesne = VeritabaniYardimcisi._privateConstructor();

  factory VeritabaniYardimcisi() {
    return _nesne;
  }

  static const _dbName = "rehber.sqlite";
  static Future<Database> connect() async {
    String dbPath = join(await getDatabasesPath(), _dbName);
    if (await databaseExists(dbPath)) {
      if (kDebugMode) {
        print("Veritabanı var");
      }
    } else {
      ByteData data = await rootBundle.load("veritabani/$_dbName");
      List<int> bytes = data.buffer.asInt8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(dbPath).writeAsBytes(bytes, flush: true);
      if (kDebugMode) {
        print("Veritabanı kopyalandı");
      }
    }
    return openDatabase(dbPath);
  }
}

