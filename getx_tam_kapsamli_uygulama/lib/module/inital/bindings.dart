import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/service/network_manager.dart';

class InitalPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager());
  }
}
