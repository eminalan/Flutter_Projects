import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/constants/assets.dart';
import 'package:getx_tam_kapsamli_uygulama/module/inital/controller.dart';
import 'package:lottie/lottie.dart';

class InitalPage extends GetView<InitalPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: LottieBuilder.asset(Assets.A3_LOTTIE),),
    );
  }
}
