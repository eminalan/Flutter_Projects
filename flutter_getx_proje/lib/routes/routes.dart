// ignore_for_file: constant_identifier_names

// Routes classını abstract olarak yaparız çünkü herhangi bir nesne türetmeyecez.
abstract class Routes {
  // Uygulama içindeki her bir sayfa için sabit bir rota adı tanımlar.
  // Bu sabitler, GetX'in rota yönetim sisteminde sayfalara erişmek için kullanılır.
  // Sabit isimlendirme, yazım hatalarını önlemek ve kodun okunabilirliğini artırmak için kullanılır.

  static const String HOME_PAGE = "/home-page"; // Ana sayfa için rota adı.  `/home-page`  Get.toNamed() fonksiyonunda kullanılacak string.
  static const String PROFILE_PAGE = "/profile-page"; // Profil sayfası için rota adı. `/profile-page`  Get.toNamed() fonksiyonunda kullanılacak string.
  static const String TEST_PAGE = "/test-page"; // Test sayfası için rota adı.  `/test-page`  Get.toNamed() fonksiyonunda kullanılacak string.  Şu anda kullanılmıyor.
}
