import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/repository/user_repository.dart';
import 'package:getx_tam_kapsamli_uygulama/routes/routes.dart';
import 'package:getx_tam_kapsamli_uygulama/service/network_manager.dart';

class InitalBinding implements Bindings {
  @override
  void dependencies() async {
    await Future.delayed(Duration(seconds: 3));
    service();
    repository();
    Get.offAllNamed(Routes.USERS, );
  }

  void service() {
    Get.put(NetworkManager());
  }

  void repository() {
    Get.put(UserRepository());
  }
}
