import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osman2/main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../view_model/vm_anasayfa.dart';

class Sayfa2 extends StatelessWidget {
   Sayfa2({super.key});
  List<dynamic> gelen=Get.arguments;
  //Local Veriable
  VmAnasayfa vmAnasayfa=Get.put(VmAnasayfa(),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sayfa-2"),
      ),
      body: _buildBODY(context),
    );
  }

  Widget _buildBODY(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       "${vmAnasayfa.sayac}".text.make(),
        Text(gelen[0]),
      ],
    ).centered();
  }
}
