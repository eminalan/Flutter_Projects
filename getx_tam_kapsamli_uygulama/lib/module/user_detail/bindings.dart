import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/module/user_detail/controller.dart';

class UserDetailPageBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<UserDetailPageController>(() => UserDetailPageController());
  }
}