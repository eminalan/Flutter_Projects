import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/model/response/user.dart';
import 'package:getx_tam_kapsamli_uygulama/service/network_manager.dart';

class UserRepository extends GetxService {
  NetworkManager _networkManager = Get.find();
  Future<List<User>?> getUsers() async {
    final response = await _networkManager.get(
      "https://jsonplaceholder.typicode.com/users",
    );
    return (response.data as List).map((e) => User.fromJson(e)).toList();
  }
}
