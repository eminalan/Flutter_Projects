import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osman2/routes/routes.dart';
import 'package:osman2/view_model/vm_anasayfa.dart';
import 'package:velocity_x/velocity_x.dart';

class AnaSayfa extends StatelessWidget {
  AnaSayfa({super.key});

  final VmAnasayfa vmAnasayfa = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ana Sayfa"),
      ),
      body: _buildBODY(context),
    );
  }

  Widget _buildBODY(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => "${vmAnasayfa.sayac}".text.bold.xl4.make(),),
        [
          ElevatedButton(onPressed: () {
            vmAnasayfa.arttir();
          }, child: "Arttır".text.make()),
          10.widthBox,
          ElevatedButton(onPressed: () {
            vmAnasayfa.azalt();
          }, child: "Azalt".text.make()),
        ].hStack(alignment: MainAxisAlignment.center),
        ElevatedButton(onPressed: () {
          Get.toNamed(Routes.SAYFA_2,arguments: ["Ahmet","Osman"]);
        }, child: "Sayfa 2 ye git".text.make())
      ],
      
    ).centered();
  }
}
