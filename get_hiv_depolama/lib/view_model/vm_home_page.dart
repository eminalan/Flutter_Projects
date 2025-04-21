import 'package:get/state_manager.dart';

import '../services/local_storage/hivee.dart';

class VmHomePage extends GetxController {
  //onInit ile sayac degeri atanıyor..
  @override
  void onInit() {
    super.onInit();
    setSayac(); //Atama yapacak metod..
  }

  var sayac = 0.obs; //Takip edilecek obs değişkeni tanımlanıyor
  //arttir metodu ile sayac değeri arttırılıp
  //Hive e 'count' keyi ile kaydediliyor..
  void arttir() {
    //Takip edilen sayac degiskenine Hive de kaydedilen degerin bir fazlası atanıyor..
    sayac.value = Hivee.box.get("count", defaultValue: 0) + 1;
    Hivee.box.put("count",
        sayac.value); //sayac degiskeninin yeni degeri Hive kaydediliyor..
  }


  void azalt() {
    if (sayac.value > 0) {
      sayac.value = Hivee.box.get("count", defaultValue: 0) - 1;
      Hivee.box.put("count", sayac.value);
    }
  }

  void setSayac() {
    //sayac degiskenine kaydedilen degeri atanıyor..
    //Kayıtlı deger yoksa 0 degeri atanıyor
    sayac.value = Hivee.box.get("count", defaultValue: 0);
  }
}
