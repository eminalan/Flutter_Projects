import 'package:get/get.dart';

class VmAnasayfa extends GetxController{
  var sayac=0.obs;

  void arttir (){
    sayac++;
    print(sayac);
  }

  void azalt (){
    sayac--;
  }
}