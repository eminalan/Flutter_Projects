// ignore_for_file: non_constant_identifier_names

import 'package:sqlite_forefin_kullanimi/kategoriler.dart';
import 'package:sqlite_forefin_kullanimi/yonetmenler.dart';

class Filmler {
  int? film_id;
  String? film_ad;
  int? film_yil;
  String? film_resim;
  Kategoriler? kategori;
  Yonetmenler? yonetmen;

  Filmler(
    this.film_id,
    this.film_ad,
    this.film_yil,
    this.film_resim,
    this.kategori,
    this.yonetmen,
  );

  // fromMap - null kontrollü
  factory Filmler.fromMap(Map<String, dynamic> map) {
    return Filmler(
      map['film_id'] != null ? map['film_id'] as int : null,
      map['film_ad'] != null ? map['film_ad'] as String : null,
      map['film_yil'] != null ? map['film_yil'] as int : null,
      map['film_resim'] != null ? map['film_resim'] as String : null,
      (map['kategori_id'] != null && map['kategori_ad'] != null)
          ? Kategoriler.fromMap(map)
          : null,
      (map['yonetmen_id'] != null && map['yonetmen_ad'] != null)
          ? Yonetmenler.fromMap(map)
          : null,
    );
  }

  // toMap - null kontrollü
  Map<String, dynamic> toMap() {
    return {
      'film_id': film_id,
      'film_ad': film_ad,
      'film_yil': film_yil,
      'film_resim': film_resim,
      'kategori_id': kategori?.kategori_id,
      'yonetmen_id': yonetmen?.yonetmen_id,
    };
  }
  @override
  String toString() {
    return 'Filmler{film_id: $film_id, film_ad: $film_ad, film_yil: $film_yil, film_resim: $film_resim, kategori: $kategori, yonetmen: $yonetmen}';
  }
}