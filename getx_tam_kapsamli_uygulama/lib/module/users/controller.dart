import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/model/response/user.dart';
import 'package:getx_tam_kapsamli_uygulama/repository/user_repository.dart';

class UserPageController extends GetxController {
  UserRepository _networkManager = Get.find();
  List<User>? users;
  @override
  void onInit() async {
    super.onInit();
    users = await _networkManager.getUsers(); 
    update();
  }
}
