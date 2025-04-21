import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_tam_kapsamli_uygulama/module/inital/bindings.dart';
import 'package:getx_tam_kapsamli_uygulama/module/inital/page.dart';
import 'package:getx_tam_kapsamli_uygulama/module/user_detail/bindings.dart';
import 'package:getx_tam_kapsamli_uygulama/module/user_detail/page.dart';
import 'package:getx_tam_kapsamli_uygulama/module/users/bindings.dart';
import 'package:getx_tam_kapsamli_uygulama/module/users/page.dart';
import 'package:getx_tam_kapsamli_uygulama/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitalPage(),
      binding: InitalPageBinding(),
    ),
    GetPage(
      name: Routes.USERS,
      page: () => UserPage(),
      binding: UserPageBinding(),
    ),
    GetPage(
      name: Routes.USERS_DETAIL,
      page: () => UserDetailPage(),
      binding: UserDetailPageBinding(),
    ),
  ];
}
