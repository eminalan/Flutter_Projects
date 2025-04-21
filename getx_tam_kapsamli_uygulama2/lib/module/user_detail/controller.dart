import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/model/response/user.dart';

/// `UserDetailPageController`, `UserDetailPage` ekranında gösterilecek
/// kullanıcı verilerini yöneten bir GetX controller'ıdır.
/// Controller,  `Get.arguments` kullanılarak route'a parametre olarak
/// gönderilen `User` nesnesini alır ve bunu `user` değişkeninde saklar.
/// Bu değişken, `UserDetailPage` widget'ı tarafından kullanıcının bilgilerini
/// görüntülemek için kullanılır.  `GetxController`'dan türetildiği için,
/// GetX'in durum yönetimi ve lifecycle metotlarından faydalanabilir.
class UserDetailPageController extends GetxController {
  /// Kullanıcı verilerini tutan değişken.  `User` sınıfının bir örneği.
  /// `Get.arguments` kullanılarak route'a parametre olarak gönderilen
  /// kullanıcı verilerini alır.
  User user = Get.arguments;
}
