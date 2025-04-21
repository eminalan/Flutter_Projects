import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/service/network_manager.dart';

/// `InitalPageBinding`, GetX kütüphanesinin `Bindings` arayüzünü uygulayan bir sınıftır.
/// Bu Binding,  `InitalPage` (varsayılan olarak ana sayfa veya splash screen olarak
/// düşünülebilir) route'u için gerekli bağımlılıkları (burada sadece `NetworkManager`)
/// GetX'e kaydeder.  Bağımlılık enjeksiyonu (dependency injection) prensibini kullanarak
/// kodun daha modüler ve test edilebilir olmasını sağlar.
class InitalPageBinding implements Bindings {
  /// `dependencies()` metodu, `Bindings` arayüzünün bir parçasıdır ve GetX tarafından
  /// `InitalPage` route'u yüklenirken çağrılır.  Bu metot içinde, `InitalPage`
  /// için gerekli olan bağımlılıklar GetX'e kaydedilir.
  ///
  /// `Get.lazyPut()` metodu, `NetworkManager` nesnesinin, yalnızca ihtiyaç duyulduğu
  /// anda (ilk kez kullanılmak istendiğinde) oluşturulmasını sağlar.  Bu, uygulama
  /// başlangıcında gereksiz nesne oluşturulmasını önler ve performansı iyileştirebilir.
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager());
  }
}
