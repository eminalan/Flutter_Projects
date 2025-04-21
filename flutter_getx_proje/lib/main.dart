import 'package:flutter/material.dart';
import 'package:flutter_getx_proje/routes/pages.dart';
import 'package:flutter_getx_proje/routes/routes.dart';
import 'package:flutter_getx_proje/service/test_service.dart';
import 'package:get/get.dart';

void main() {
  // Uygulama başlatılmadan önce TestService'in bir örneğini oluşturur ve GetX'in bağımlılık enjeksiyon sistemine ekler.
  // Bu, ProfilePageController tarafından ihtiyaç duyulduğunda TestService'e kolayca erişilebilmesini sağlar.
  Get.put(TestService()); 
  runApp(const MyApp());
}

// GetX'te controller oluşturma ve yönetme yöntemleri açıklaması:
// Get.put<T>(T controller): Controller'ı oluşturur ve dependency injection sistemine ekler. Uygulama başladığı andan itibaren controller bellekte bulunur ve uygulama kapanana kadar yaşar.  En sık kullanılan yöntemdir.
// Get.lazyPut<T>(() => T, fenix: false): Controller'ı sadece ihtiyaç duyulduğunda oluşturur.  `fenix: true` olarak ayarlanırsa, controller silinip tekrar oluşturulduğunda (örneğin rotadan çıkıp tekrar girildiğinde) önceki durumunu korur.
// Get.create<T>(() => T, permanent: false):  Her ihtiyaç duyulduğunda yeni bir controller örneği oluşturur. `permanent: true` ise controller kalıcı olur ve silinmez.
// Get.putAsync<T>(() async => await T): Asenkron olarak controller oluşturmak için kullanılır. Örneğin, controller'ın başlatılması için bir API çağrısı yapılması gerekiyorsa bu yöntem kullanılabilir.
// Get.find<T>(): Kayıtlı olan bir controller'ı bulur ve döndürür. Controller'ın önceden Get.put, Get.lazyPut veya Get.create ile oluşturulmuş olması gerekir.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Uygulamanın başlangıcında gösterilen debug banner'ını gizler.
      initialRoute: Routes.HOME_PAGE, // Uygulamanın başlangıç rotasını HOME_PAGE olarak tanımlar. (routes.dart'ta tanımlanmıştır.)
      getPages: Pages.pages, // Pages.pages listesini (pages.dart'ta tanımlanmıştır) GetMaterialApp'e geçirir. Bu liste, uygulamada kullanılan tüm rotaları ve bunlarla ilişkili widget'ları ve binding'leri içerir.
    );
  }
}
