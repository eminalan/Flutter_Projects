import 'package:flutter_db_alistirma/bindings/home_binding.dart';
import 'package:flutter_db_alistirma/page/home_page.dart';
import 'package:flutter_db_alistirma/routes/routes.dart';
import 'package:get/get.dart';

abstract class Pages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => HomePage(),
      binding: BindingsBuilder(() => HomeBinding()),
    ),
  ];
}
