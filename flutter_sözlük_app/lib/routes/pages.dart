import 'package:flutter_application/home_page/home_page_controller.dart';
import 'package:flutter_application/home_page/home_page_page.dart';
import 'package:flutter_application/routes/routes.dart';
import 'package:get/get.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => HomePage(),
      binding: BindingsBuilder(
        () => Get.put<HomePageController>(HomePageController()),
      ),
    ),
  ];
}
