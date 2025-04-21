import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/model/response/user.dart';
import 'package:getx_tam_kapsamli_uygulama/service/network_manager.dart';

/// `UserRepository`, kullanıcı verilerine erişim sağlayan bir repository'dir.
///  `GetxService`'den türetilmiştir ve `NetworkManager` kullanarak
///  API'den kullanıcı verilerini alır.  Bu, veri erişimini uygulama mantığından
///  ayırır ve daha test edilebilir bir kod yapısı oluşturur.
class UserRepository extends GetxService {
  /// `NetworkManager` nesnesinin bir örneği.  `Get.find()` metodu ile
  /// dependency injection kullanılarak elde edilir.  Bu, `NetworkManager`'ın
  /// önceden GetX tarafından kaydedilmiş olması gerektiğini gösterir.
  NetworkManager _networkManager = Get.find();

  /// `getUsers()` metodu,  `https://jsonplaceholder.typicode.com/users` adresinden
  /// kullanıcı verilerini alır.  `NetworkManager`'ın `get()` metodu kullanılarak
  /// API çağrısı yapılır.  Cevap, `List<User>` türünde bir listeye dönüştürülür.
  /// Eğer bir hata oluşursa, null döndürülür.  Bu metot, `Future<List<User>?>`
  /// türünde bir değer döndürür, bu da asenkron bir işlem olduğunu ve null
  /// bir değer döndürebileceğini gösterir.
  Future<List<User>?> getUsers() async {
    final response = await _networkManager.get(
      "https://jsonplaceholder.typicode.com/users",
    );
    // Hata yönetimi eklenebilir (örneğin, response.hasError kontrolü)
    return (response.data as List).map((e) => User.fromJson(e)).toList();
  }
}
