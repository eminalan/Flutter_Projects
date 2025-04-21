import 'package:flutter_getx_proje/controller/home_page_controller.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  // Bu sınıf, HomePageController'ın bağımlılığını (dependency) yönetmek için kullanılır.
  // GetX'in bağımlılık enjeksiyon sistemini (dependency injection) kullanarak controller'ı
  // ihtiyacı olan widget'lara sağlamayı ve yönetmeyi sağlar.

  @override
  void dependencies() {
    // Bu metot, hangi bağımlılıkların (örneğin, controller'lar, servisler)
    // uygulamada kullanılabilir olacağını tanımlar.
    // Get.put() metodu, bir bağımlılığı (bu durumda HomePageController) GetX'in
    // bağımlılık deposuna (dependency container) ekler ve onu kullanılabilir hale getirir.
    // Bu satır, HomePageController sınıfından bir örnek oluşturur ve onu GetX'in
    // bağımlılık enjeksiyon sistemi tarafından erişilebilir hale getirir.
    // Yani, HomePageController'a ihtiyaç duyan herhangi bir widget,
    // Get.find<HomePageController>() metodu ile bu controller'a erişebilir ve kullanabilir.
    Get.put(HomePageController());
  }
}
