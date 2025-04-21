import 'package:get/get.dart';
import 'package:sqflitedeneme/services/SQLDb/crud.dart';

import '../models/model_kisi.dart';

class VmHomePage extends GetxController {
  var kisilerList = <ModelKisi>[].obs;
  var isLoad = false.obs;
  Crud db = Crud();
  /*VmHomePage() {
    readKisiler();
  }*/
  @override
  void onInit() {
    super.onInit();
    readKisiler();
  }

  Future readKisiler() async {
    isLoad = false.obs;
    kisilerList.value = await db.readKisiler();
    isLoad.value = true;
  }

  Future createKisiler(ModelKisi kisi) async {
    int kaydedilenID = await db.createKisiler(kisi);
    if (kaydedilenID > 0) {
      kisilerList.add(kisi);
    } else {
      Get.snackbar("Hata", "Kayıt yapılamadı!");
    }
    
  }

  Future deleteKisiler(ModelKisi kisi) async{
  int silinenKayitSayisi = await db.deleteKisiler(kisi);
  if (silinenKayitSayisi > 0) {
    kisilerList.removeWhere((element) => element.id_kisi == kisi.id_kisi);
    Get.snackbar("Silindi", "silinenKayitSayisi: ${silinenKayitSayisi.toString()}");
  } else {
    Get.snackbar("Hata", "Silinemedi!");
  }
  }

  void updateKisiler(ModelKisi updatedKisi)async {
    int silinenKayitSayisi = await db.updateKisiler(updatedKisi);
    //int updatedKisiIndex = kisilerList.indexWhere((kisi) => kisi.id_kisi == updatedKisi.id_kisi);
    if (silinenKayitSayisi != -1) {
      kisilerList.value = await db.readKisiler();
      Get.snackbar("Güncellendi", "Güncellenen Kişi: ${updatedKisi.ad}");
    } else {
      Get.snackbar("Hata", "Güncellenemedi!");
    }
  }

}
