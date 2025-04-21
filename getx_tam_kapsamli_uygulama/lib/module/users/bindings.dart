import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/module/users/controller.dart';

class UserPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserPageController());
  }
}
