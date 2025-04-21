import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestService extends GetxService {
  // TestService, GetX'in GetxService sınıfından türetilmiş bir sınıftır.
  // GetxService, GetX'in bağımlılık enjeksiyon sisteminde servis olarak kullanılmak üzere tasarlanmıştır.

  internettenVeriCek() async {
    // internettenVeriCek() metodu, bir ağ isteği yapar gibi davranır.
    // Aslında, sadece 2 saniye bekler ve ardından "Veri Çekme İşlemi Başarılı" mesajını konsola yazar.
    // Gerçek bir uygulamada, bu metod bir API'ye istek gönderir ve verileri işlerdi.

    await Future.delayed(Duration(seconds: 2)); // 2 saniye bekler.
    debugPrint("Veri Çekme İşlemi Başarılı"); // "Veri Çekme İşlemi Başarılı" mesajını konsola yazar.
  }
}
