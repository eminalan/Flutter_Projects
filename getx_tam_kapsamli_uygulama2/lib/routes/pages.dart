import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_tam_kapsamli_uygulama/module/inital/bindings.dart';
import 'package:getx_tam_kapsamli_uygulama/module/inital/page.dart'; // InitalPage -> InitialPage olarak düzeltildi
import 'package:getx_tam_kapsamli_uygulama/module/user_detail/bindings.dart';
import 'package:getx_tam_kapsamli_uygulama/module/user_detail/page.dart';
import 'package:getx_tam_kapsamli_uygulama/module/users/bindings.dart';
import 'package:getx_tam_kapsamli_uygulama/module/users/page.dart';
import 'package:getx_tam_kapsamli_uygulama/routes/routes.dart';

/// `AppPages` sınıfı, uygulamada kullanılacak tüm GetX route'larını tanımlar.
/// `pages` listesi, her bir route için `GetPage` nesnelerini içerir.
/// Her `GetPage` nesnesi, route'un adını (`name`), oluşturulacak widget'ı (`page`)
/// ve route ile ilişkilendirilecek binding'i (`binding`) tanımlar.
abstract class AppPages {
  /// Uygulamada kullanılacak tüm route'ların listesi.
  static final pages = [
    /// Başlangıç sayfası (genellikle splash screen).
    GetPage(
      name: Routes.INITIAL, // Route'un adı (Routes.INITIAL)
      page: () => InitalPage(), // Oluşturulacak widget (InitialPage)
      binding: InitalPageBinding(), // Route'un binding'i (InitalPageBinding)
    ),
    /// Kullanıcılar listesi sayfası.
    GetPage(
      name: Routes.USERS,
      page: () => UserPage(),
      binding: UserPageBinding(),
    ),
    /// Kullanıcı detay sayfası.
    GetPage(
      name: Routes.USERS_DETAIL,
      page: () => UserDetailPage(),
      binding: UserDetailPageBinding(),
    ),
  ];
}
