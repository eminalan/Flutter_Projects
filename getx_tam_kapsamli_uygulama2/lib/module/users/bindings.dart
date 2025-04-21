import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/module/users/controller.dart';

/// `UserPageBinding`, GetX'in dependency injection mekanizmasını kullanarak
/// `UserPage` route'una `UserPageController`'ı bağlayan bir binding'dir.
/// Bu binding, `UserPage` route'u yüklendiğinde `UserPageController`'ın
/// GetX tarafından otomatik olarak oluşturulmasını ve yönetilmesini sağlar.
/// `Get.lazyPut` kullanımı, controller'ın yalnızca ihtiyaç duyulduğu anda
/// (ilk kez erişildiğinde) oluşturulmasını sağlar. Bu, uygulama performansını
/// iyileştirmeye yardımcı olur, çünkü gereksiz nesnelerin oluşturulması önlenir.
class UserPageBinding implements Bindings {
  /// `dependencies()` metodu, `Bindings` arayüzünün bir parçasıdır ve GetX
  /// tarafından `UserPage` route'u yüklendiğinde çağrılır. Bu metot,
  /// `UserPageController`'ı GetX'e kaydeder.  `lazyPut` sayesinde controller
  /// ilk kez ihtiyaç duyulduğunda oluşturulur.
  @override
  void dependencies() {
    Get.lazyPut<UserPageController>(() => UserPageController());
  }
}
