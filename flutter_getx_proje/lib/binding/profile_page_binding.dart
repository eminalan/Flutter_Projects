import 'package:flutter_getx_proje/controller/profile_page_controller.dart';
import 'package:flutter_getx_proje/service/test_service.dart';
import 'package:get/get.dart';

class ProfilePageBinding implements Bindings {
  // Bu sınıf, ProfilePageController'ın bağımlılıklarını (dependencies) yönetmek için kullanılır.
  // GetX'in bağımlılık enjeksiyon sistemini kullanarak ProfilePageController ve onun bağımlılıklarını
  // (bu durumda TestService)  ihtiyaç duyan widget'lara sağlar.

  @override
  void dependencies() {
    // Bu metod, ProfilePageController'ı ve onun bağımlılıklarını GetX'in
    // bağımlılık deposuna (dependency container) ekler.

    // Get.find<TestService>() ile TestService'in önceden tanımlanmış bir örneğini bulur.
    // Eğer TestService daha önce Get.put() ile eklenmediyse hata fırlatır.
    // Bu, TestService'in ProfilePageController'dan önce tanımlanması gerektiğini gösterir.

    // Get.put(ProfilePageController(testService: Get.find<TestService>())); satırı ise,
    // ProfilePageController'ın bir örneğini oluşturur ve ona önceden bulunmuş TestService örneğini enjekte eder.
    // Daha sonra bu controller örneğini GetX'in bağımlılık deposuna ekler.
    // Böylece, ProfilePage ve onun alt widget'ları, Get.find<ProfilePageController>() ile
    // ProfilePageController'a kolayca erişebilirler.

    Get.put(ProfilePageController(testService: Get.find<TestService>()));
  }
}
