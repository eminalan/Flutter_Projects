import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxBool isChecked = false.obs; // Reaktif CheckBox durumu
  final String _prefKey = 'checkbox_state';

  @override
  void onInit() {
    super.onInit();
    // Uygulama başladığında durumu yükle
    _loadCheckBoxState();
  }

  // SharedPreferences'tan durumu yükle
  Future<void> _loadCheckBoxState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isChecked.value = prefs.getBool(_prefKey) ?? false;
  }

  // CheckBox durumunu kaydet
  Future<void> saveCheckBoxState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, value);
    isChecked.value = value;
  }
}
