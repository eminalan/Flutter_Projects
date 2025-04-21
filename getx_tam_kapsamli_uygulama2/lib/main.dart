import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_tam_kapsamli_uygulama/UI/themDatas.dart'; // Temalar için
import 'package:getx_tam_kapsamli_uygulama/base/inital_bindings.dart'; // Başlangıç binding'i
import 'package:getx_tam_kapsamli_uygulama/routes/pages.dart'; // Route tanımları
import 'package:getx_tam_kapsamli_uygulama/routes/routes.dart'; // Route isimleri

void main() {
  runApp(const MyApp()); // MyApp widget'ını çalıştırır
}

/// Uygulamanın ana widget'ı.  `GetMaterialApp` widget'ını kullanarak GetX
/// routing ve dependency injection sistemini kurar.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// Debug modunda banner'ı gizler.
      debugShowCheckedModeBanner: false,
      /// Uygulamanın temasını tanımlar.  `ThemData1()` fonksiyonu tarafından
      /// oluşturulan bir tema kullanır.
      theme: ThemData1(),
      /// Uygulamada kullanılacak route'ları tanımlar. `AppPages.pages` listesi,
      /// tüm route tanımlarını içerir.
      getPages: AppPages.pages,
      /// Uygulamanın başlangıç route'unu tanımlar. `Routes.INITIAL`, genellikle
      /// splash screen veya başlangıç ekranını temsil eder.
      initialRoute: Routes.INITIAL,
      /// Uygulamanın başlangıcında çalıştırılacak binding'i tanımlar.
      /// `InitalBinding()`, gerekli bağımlılıkları (servisler, repository'ler
      /// vb.) GetX'e kaydeder.
      initialBinding: InitalBinding(),
    );
  }
}
