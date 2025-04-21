import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/module/user_detail/controller.dart';

/// `UserDetailPageBinding`, GetX'in dependency injection sistemini kullanarak
/// `UserDetailPage` route'una `UserDetailPageController`'ı bağlayan bir Binding'dir.
///  `Get.lazyPut` metodu, controller'ın yalnızca ihtiyaç duyulduğu anda
///  (ilk kez erişildiğinde) oluşturulmasını sağlar.  Bu, uygulama performansını
///  iyileştirmeye yardımcı olur.
class UserDetailPageBinding implements Bindings {
  /// `dependencies()` metodu,  `Bindings` arayüzünün bir parçasıdır ve GetX
  /// tarafından `UserDetailPage` route'u yüklenirken çağrılır.  Bu metot,
  /// `UserDetailPageController`'ı GetX'e kaydeder.
  @override
  void dependencies() {
    Get.lazyPut<UserDetailPageController>(() => UserDetailPageController());
  }
}
