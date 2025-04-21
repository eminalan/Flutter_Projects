

import 'package:get/get.dart';
import 'package:getx_hive/routes/routes.dart';
import 'package:getx_hive/view_model/vm_home_page.dart';
import 'package:getx_hive/views/home_page.dart';

//Get sayfaları tanımlanıyor..
abstract class Pagess {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.HOME_PAGE, //Routes classından sayfa alınıyor
      page: () => HomePage(), //Sayfa tanımlanıyor
      bindings: [
        BindingsBuilder.put(() => VmHomePage()),
      ], // Çoklu bindings
    ),GetPage(
      name: Routes.DENEME, //Routes classından sayfa alınıyor
      page: () => HomePage(), //Sayfa tanımlanıyor
       bindings: [
        BindingsBuilder.put(() => VmHomePage()),
      ],
      // Çoklu bindings
    ),
  
  ];
}
