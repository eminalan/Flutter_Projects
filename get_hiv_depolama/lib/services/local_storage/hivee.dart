import 'package:hive_flutter/hive_flutter.dart';

abstract class Hivee {
  //static initialize metodu..
  static Future<void> initialize() async {
    //Hive başlatılıyor..
    await Hive.initFlutter();
    //Box açılıyor..
    await Hive.openBox("count");
  }

  //Diğer class lardan erişim için static box tanımlanıyor..
  static Box box = Hive.box("count");
}
