import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  // BaseController, GetX kütüphanesindeki GetxController sınıfından türetilmiş bir sınıftır.
  // Bu sınıf, diğer controller'ların temel sınıfı olarak kullanılır ve ortak fonksiyonları içerir.

  @override
  void onInit() {
    // onInit() metodu, controller örneği oluşturulduğunda otomatik olarak çağrılır.
    // Bu metod, controller'ın başlatılması için gerekli işlemleri gerçekleştirmek için kullanılır.
    // Örneğin, verilerin yüklenmesi, ağ isteklerinin yapılması veya diğer başlatma işlemleri burada yapılabilir.
    super.onInit(); // GetxController'ın onInit() metodunu çağırır.
    debugPrint('Bir Adet Controller Oluşturuldu'); // Controller oluşturulduğunu konsola yazar.
  }

  @override
  void onClose() {
    // onClose() metodu, controller örneği yok edildiğinde otomatik olarak çağrılır.
    // Bu metod, controller'ın temizlenmesi için gerekli işlemleri gerçekleştirmek için kullanılır.
    // Örneğin, dinleyicilerin (listeners) kaldırılması, kaynakların serbest bırakılması veya diğer temizleme işlemleri burada yapılabilir.
    super.onClose(); // GetxController'ın onClose() metodunu çağırır.
    debugPrint('Kullanıcı Çıkış Yaptı Silindi'); // Controller'ın yok edildiğini konsola yazar.
  }
}
