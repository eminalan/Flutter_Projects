import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/model/response/user.dart';
import 'package:getx_tam_kapsamli_uygulama/repository/user_repository.dart';

/// `UserPageController`, kullanıcı listesini (`users`)  yöneten bir GetX
/// controller'ıdır.  `UserRepository` kullanarak kullanıcı verilerini alır
/// ve GetX'in `update()` metodu ile UI'ı günceller.  `onInit()` metodu,
/// controller başlatıldığında kullanıcı verilerinin alınmasını sağlar.
class UserPageController extends GetxController {
  /// `UserRepository` nesnesinin bir örneği.  `Get.find()` metodu ile
  /// dependency injection sistemi kullanılarak elde edilir.
  final UserRepository _networkManager = Get.find();

  /// Kullanıcı listesini tutan değişken.  `List<User>` türünde, null olabilir.
  /// Veriler `onInit()` metodunda yüklenir.
  List<User>? users;

  /// `onInit()` metodu, GetX controller'ı başlatıldığında çağrılır.
  /// Bu metotta, `UserRepository` kullanılarak kullanıcı verileri alınır
  /// ve `users` değişkenine atanır.  `update()` metodu, UI'ın güncellenmesini
  /// sağlar.  `try-catch` bloğu, olası hataları yakalamak için kullanılır.
  @override
  void onInit() async {
    super.onInit();
    try {
      users = await _networkManager.getUsers();
      update(); // UI güncellemesi
    } catch (e) {
      // Hata yönetimi (loglama veya hata mesajı gösterimi eklenebilir)
      print("Error fetching users: $e");
    }
  }
}
