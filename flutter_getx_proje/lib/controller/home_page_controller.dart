import 'package:flutter/foundation.dart';
import 'package:flutter_getx_proje/controller/base_controller.dart';


class HomePageController extends BaseController{
  // HomePageController, BaseController sınıfından türetilir.  Bu, BaseController'da tanımlanan
  // onInit() ve onClose() gibi metotları miras almasını sağlar.

  @override
  void onInit() {
    // onInit(), GetX'in controller'ı başlatırken çağırdığı bir metottur.
    // Bu metod, controller'ın başlatılması için gerekli işlemleri yapmak için kullanılır.
    // Örneğin, verilerin yüklenmesi, ağ istekleri veya diğer başlatma görevleri burada yapılabilir.
    super.onInit(); // BaseController'ın onInit() metodunu çağırır (burada sadece debugPrint çağrısı var).
    debugPrint("Home Page Controller oluşturuldu"); // Controller'ın oluşturulduğunu konsola yazar.
  }
}
