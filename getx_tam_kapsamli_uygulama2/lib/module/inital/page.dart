import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/constants/assets.dart';
import 'package:getx_tam_kapsamli_uygulama/module/inital/controller.dart';
import 'package:lottie/lottie.dart';

/// `InitalPage`, uygulamanın başlangıç ekranını (genellikle splash screen) temsil eden
/// bir Flutter widget'ıdır.  Bu ekran,  `LottieBuilder` widget'ı kullanılarak
/// bir animasyonlu görsel görüntüler.
///
/// `GetView` widget'ı kullanılarak oluşturulmuştur. Bu, GetX kütüphanesinin
/// state management özelliklerinden faydalanmayı kolaylaştırır.  `InitalPageController`
///  adlı bir controller ile ilişkilidir; ancak şu anda controller herhangi bir
///  işlevsellik sağlamamaktadır.
class InitalPage extends GetView<InitalPageController> {
  @override
  Widget build(BuildContext context) {
    /// `Scaffold` widget'ı, ekranın temel yapısını oluşturur.
    /// `body` özelliği, ekranın içeriğini belirler.
    /// `Center` widget'ı, içeriği ekranın ortasına yerleştirir.
    /// `LottieBuilder.asset(Assets.A3_LOTTIE)` ise, `assets` klasöründe
    /// bulunan `A3_LOTTIE` adlı bir Lottie animasyonunu görüntüler.
    return Scaffold(
      body: Center(child: LottieBuilder.asset(Assets.A3_LOTTIE)),
    );
  }
}
