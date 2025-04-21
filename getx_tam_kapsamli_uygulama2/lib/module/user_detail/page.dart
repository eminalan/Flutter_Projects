import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/module/user_detail/controller.dart';

/// `UserDetailPage`, bir kullanıcının detaylı bilgilerini gösteren bir Flutter
/// ekranıdır (widget).  `GetView` widget'ı kullanılarak oluşturulmuştur ve
/// `UserDetailPageController` adlı bir controller ile entegredir.  Controller,
/// kullanıcının verilerini sağlar.
class UserDetailPage extends GetView<UserDetailPageController> {
  @override
  Widget build(BuildContext context) {
    /// `Scaffold` widget'ı, ekranın temel yapısını oluşturur.
    /// `appBar` özelliği, ekranın üst kısmındaki AppBar'ı tanımlar.  AppBar'ın başlığı,
    /// controller'dan alınan kullanıcının adıdır.  Ad null ise "null" yazdırılır.
    ///
    /// `body` özelliği, ekranın ana içeriğini tanımlar.  Bir `Wrap` widget'ı,
    /// içeriğin ekran genişliğine göre otomatik olarak sarmasını sağlar.
    ///
    /// İçerikte, kullanıcının e-postası, telefon numarası ve şirket adı gösterilir.
    ///  Her bir bilgi, `ListTile` içinde gösterilir ve null ise "null" yazdırılır.
    /// `ListTile` tıklandığında, ekran kapatılır (`Get.back()`).
    return Scaffold(
      appBar: AppBar(title: Text(controller.user.name ?? "null")),
      body: Wrap(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.black,
            child: Center(
              child: ListTile(
                title: Text(
                  controller.user.email ?? "null",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  controller.user.phone ?? "null",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  controller.user.company?.name ?? "null",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.back();
                },
                contentPadding: EdgeInsets.all(16),
                leading: Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
