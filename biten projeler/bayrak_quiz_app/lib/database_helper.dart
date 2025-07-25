import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi{

  static final String veritabaniAdi = "bayrakquiz.sqlite";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

    if(await databaseExists(veritabaniYolu)){//Veritabanı var mı yok mu kontrolü
      if (kDebugMode) {
        print("Veri tabanı zaten var.Kopyalamaya gerek yok");
      }
    }else{
      //assetten veritabanının alınması
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      //Veritabanının kopyalama için byte dönüşümü
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      //Veritabanının kopyalanması.
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      if (kDebugMode) {
        print("Veri tabanı kopyalandı");
      }
    }
    //Veritabanını açıyoruz.
    return openDatabase(veritabaniYolu);
  }

}



