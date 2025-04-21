import 'package:flutter_application/models/kelime.dart';
import 'package:flutter_application/services/SQL/crud.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxList<Kelime> kelimelerList = <Kelime>[].obs;
  RxBool isLoad = false.obs;
  Crud db = Crud();
  @override
  void onInit() {
    super.onInit();
    readKelime();
  }

  Future readKelime() async {
    isLoad.value = false;
    kelimelerList.value = await db.readKelime();
    isLoad.value = true;
  }

  Future createKelime(Kelime kelime) async {
    int kaydedilenID = await db.createKelime(kelime);
    if (kaydedilenID > 0) {
      kelimelerList.add(kelime);
    } else {
      Get.snackbar("Hata", "Kayıt yapılamadı!");
    }
  }

  Future deleteKisiler(Kelime kisi) async {
    int silinenKayitSayisi = await db.deleteKelime(kisi);
    if (silinenKayitSayisi > 0) {
      kelimelerList.removeWhere((element) => element.id == kisi.id);
      Get.snackbar(
        "Silindi",
        "silinenKayitSayisi: ${silinenKayitSayisi.toString()}",
      );
    } else {
      Get.snackbar("Hata", "Silinemedi!");
    }
  }
  Future updateKisiler(Kelime kelime) async {
    int guncellenenKayitSayisi = await db.updateKelime(kelime);
    if (guncellenenKayitSayisi > 0) {
      kelimelerList.removeWhere((element) => element.id == kelime.id);
      kelimelerList.add(kelime);
      Get.snackbar(
        "Güncellendi",
        "guncellenenKayitSayisi: ${guncellenenKayitSayisi.toString()}",
      );
    } else {
      Get.snackbar("Hata", "Güncellenemedi!");
    }
  }

}
