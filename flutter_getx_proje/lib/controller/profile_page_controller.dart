import 'package:flutter/material.dart';
import 'package:flutter_getx_proje/controller/base_controller.dart';
import 'package:flutter_getx_proje/service/test_service.dart';

class ProfilePageController extends BaseController {
  // ProfilePageController, BaseController'dan türetilmiş bir GetX controller'ıdır.
  // BaseController'daki onInit() ve onClose() metodlarını miras alır.

  ProfilePageController({required testService}); // Constructor, bir TestService örneği alır. Ancak bu örnek kullanılmıyor.

  final TestService testService = TestService(); // TestService sınıfından bir örnek oluşturur.  Bu, dependency injection yerine direkt olarak instance oluşturuluyor.  Daha iyi bir yaklaşım dependency injection kullanmak olurdu.

  @override
  void onInit() {
    // onInit(), controller oluşturulduğunda GetX tarafından çağrılır.
    // Burada controller'ın başlangıç işlemleri yapılır.
    super.onInit(); // BaseController'ın onInit() metodunu çağırır.
    debugPrint("Profile Page Controller oluşturuldu"); // Oluşturulduğunu konsola yazar.
  }

  veriCek() {
    // veriCek() metodu, TestService'in internettenVeriCek() metodunu çağırır.
    // Bu metod, muhtemelen bir API çağrısı yapar ve verileri çeker.  Ancak bu kısım implement edilmemiş.
    testService.internettenVeriCek();
  }
}
