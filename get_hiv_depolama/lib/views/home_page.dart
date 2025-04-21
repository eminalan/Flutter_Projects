import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hive/o_package/o_extensions.dart';
import 'package:getx_hive/view_model/vm_home_page.dart';

class HomePage extends GetView<VmHomePage> {
  const HomePage({super.key});
  //VmHomePage bulunup vmHomePage degiskenine atanıyor..
  //final VmHomePage vmHomePage = Get.find<VmHomePage>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Home Page".oText.make(),
      ),
      body: _buildBody(context),
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return [
      "Tıklanma Sayısı"
          .oText
          .green
          .combineTextDecoration(
            underline: true,
            overLine: true,
            color: Colors.red,
          )
          .xl2
          .bold()
          .make(),
      8.height,
      //Obx ile sayac degiskeninin degisimi takip ediliyor..
      Obx(() => controller.sayac.value.oText.green
          .bold()
          .size(100)
          .make()
          .oContainer
          .border(width: 7, color: Colors.green)
          .radiusAll(45)
          .p(30)
          .backGroundColor(Colors.green[100]!)
          .make()),
    ].oColumn.mainAxisCenter.make().oCenter();
  }

  Widget _buildFAB(BuildContext context) {
    return [
      "+"
          .oText
          .white
          .xl2
          .bold()
          .make()
          .oFloatinActionButton
          .backgroundColor(Colors.green[400]!)
          .make(onPressed: () {
            controller.arttir();
          })
          .oContainer
          .radiusAll(24)
          .border(width: 7, color: Colors.green)
          .make(),

      4.height,
      //FAB-2
      "-"
          .oText
          .white
          .xl2
          .bold()
          .make()
          .oFloatinActionButton
          .backgroundColor(Colors.red[400]!)
          .make(onPressed: () {
            controller.azalt();
          })
          .oContainer
          .radiusAll(24)
          .border(width: 7, color: Colors.red)
          .make(),
    ].oColumn.mainAxisEnd.make();
  }
}
