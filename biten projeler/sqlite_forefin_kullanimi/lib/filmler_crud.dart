import 'package:sqlite_forefin_kullanimi/filimler.dart';
import 'package:sqlite_forefin_kullanimi/veritabani_yardimcisi.dart';

class FilmlerCrud {
  Future<List<Filmler>> tumFilmler() async {
    var db = await VeritabaniYardimcisi().database;

    var maps = await db.rawQuery(
      "SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id=kategoriler.kategori_id AND  filmler.yonetmen_id=yonetmenler.yonetmen_id",
    );
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Filmler.fromMap(satir);
    });
  }
}
