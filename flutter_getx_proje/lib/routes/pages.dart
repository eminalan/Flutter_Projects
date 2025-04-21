import 'package:flutter_getx_proje/binding/home_page_binding.dart';
import 'package:flutter_getx_proje/binding/profile_page_binding.dart';
import 'package:flutter_getx_proje/pages/profile_page.dart';
import 'package:flutter_getx_proje/routes/routes.dart';
import 'package:flutter_getx_proje/pages/home_page.dart';

import 'package:get/get_navigation/get_navigation.dart';

abstract class Pages {
  // Bu abstract sınıf, GetX routing sistemi için gerekli GetPage nesnelerini tanımlar.
  // GetPage nesneleri, uygulamada kullanılan her bir rota için gerekli bilgileri içerir.

  // pages listesi, uygulamada tanımlanan tüm rotaları tutar.
  static List<GetPage> pages = [
    // HomePage için GetPage nesnesi.
    // name: Routes.HOME_PAGE,  rota için kullanılan ad (Routes.dart dosyasında tanımlanır).
    // page: () => HomePage(),  rota çağrıldığında oluşturulacak widget.
    // binding: HomePageBinding(),  rota ile ilişkili bağımlılıkları (controllerlar, servisler vb.) enjekte etmek için kullanılan binding.
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    // ProfilePage için GetPage nesnesi.  HomePage ile aynı yapıda.
    GetPage(
      name: Routes.PROFILE_PAGE,
      page: () => ProfilePage(),
      binding: ProfilePageBinding(),
    ),
  ];
}
