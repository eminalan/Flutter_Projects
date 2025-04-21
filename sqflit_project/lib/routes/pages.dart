import 'package:get/get.dart';
import 'package:sqflitedeneme/routes/routes.dart';
import 'package:sqflitedeneme/view_model/vm_home_page.dart';
import 'package:sqflitedeneme/views/home_pages.dart';

abstract class Pages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () =>  HomePages(),
      binding: BindingsBuilder(() {
        Get.put(VmHomePage());
      }),
    ),
    
  ];
}