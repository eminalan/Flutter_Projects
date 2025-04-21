import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/repository/user_repository.dart';
import 'package:getx_tam_kapsamli_uygulama/routes/routes.dart';
import 'package:getx_tam_kapsamli_uygulama/service/network_manager.dart';

/// `InitialBinding`, GetX kütüphanesinin `Bindings` arayüzünü uygulayan bir sınıftır.
/// Uygulamanın başlangıcında gerekli olan bağımlılıkları (servisler, repository'ler vb.)
/// GetX'e kaydeder (register eder).  Bu, bağımlılık enjeksiyonu (dependency injection)
/// prensibini kullanarak kodun daha modüler ve test edilebilir olmasını sağlar.
class InitalBinding implements Bindings {
  /// `dependencies()` metodu, `Bindings` arayüzünün bir parçasıdır ve uygulamanın
  /// başlangıcında GetX tarafından çağrılır.  Bu metot içinde, uygulama için gerekli
  /// olan servisler ve repository'ler GetX'e kaydedilir.
  ///
  /// Öncelikle, 3 saniyelik bir gecikme (`Future.delayed`) eklenmiştir.  Bu gecikme,
  /// örneğin splash screen gösterimi gibi işlemler için kullanılabilir.
  ///
  /// Daha sonra, `service()` ve `repository()` metotları çağrılır.  Bu metotlar,
  /// sırasıyla `NetworkManager` ve `UserRepository` nesnelerini GetX'e kaydeder.
  ///
  /// Son olarak, `Get.offAllNamed(Routes.USERS)` satırı, uygulamanın ana ekranına
  /// (kullanıcılar ekranı - `Routes.USERS`) yönlendirilmesini sağlar.  `offAllNamed`
  /// metodu, mevcut navigasyon geçmişini temizleyerek yeni bir rota oluşturur.
  @override
  void dependencies() async {
    // 3 saniyelik bir gecikme ekler. Splash screen gibi işlemler için kullanılabilir.
    await Future.delayed(Duration(seconds: 3));
    // NetworkManager servisini GetX'e kaydeder.
    service();
    // UserRepository'yi GetX'e kaydeder.
    repository();
    // Uygulamayı kullanıcılar ekranına yönlendirir (ve navigasyon geçmişini temizler).
    Get.offAllNamed(Routes.USERS);
  }

  /// `NetworkManager` servisini GetX'e kaydeder.  `Get.put()` metodu, bir nesneyi
  /// GetX'in dependency injection sistemine kaydeder.
  void service() {
    Get.put(NetworkManager());
  }

  /// `UserRepository`'yi GetX'e kaydeder.  Bu, kullanıcı verilerine erişim için
  /// gereklidir.
  void repository() {
    Get.put(UserRepository());
  }
}
