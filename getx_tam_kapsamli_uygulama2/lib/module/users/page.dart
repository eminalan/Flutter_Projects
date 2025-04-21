import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/model/response/user.dart';
import 'package:getx_tam_kapsamli_uygulama/module/users/controller.dart';
import 'package:getx_tam_kapsamli_uygulama/routes/routes.dart';

/// `UserPage`, kullanıcı listesini gösteren bir Flutter ekranını (widget) temsil eder.
///  `GetView` widget'ı kullanılarak oluşturulur ve `UserPageController` ile
///  entegredir.  Controller, kullanıcı verilerini alıp işler ve bu veriler
///  `GetBuilder` widget'ı aracılığıyla arayüze yansıtılır.
class UserPage extends GetView<UserPageController> {
  @override
  Widget build(BuildContext context) {
    /// `Scaffold` widget'ı, ekranın temel yapısını oluşturur.
    /// `AppBar` widget'ı, ekranın üst kısmında bir başlık çubuğu oluşturur.
    /// `body` özelliği, ekranın ana içeriğini belirler.
    ///
    /// `GetBuilder<UserPageController>` widget'ı, `UserPageController`'daki
    /// değişikliklere tepki verir.  `controller.users` değişkenindeki değişiklikler
    /// `builder` fonksiyonunu tetikler ve arayüzü yeniden oluşturur.
    return Scaffold(
      appBar: AppBar(title: Text('User Page'), centerTitle: true),
      body: GetBuilder<UserPageController>(
        builder: (_) {
          /// Eğer `controller.users` null ise (veriler henüz yüklenmemişse),
          /// bir `CircularProgressIndicator` gösterilir.
          /// Aksi takdirde,  `ListView.builder` kullanılarak kullanıcı listesi
          /// gösterilir.
          return controller.users == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.users!.length,
                  itemBuilder: (context, index) {
                    /// Her bir kullanıcı için bir `Card` widget'ı oluşturulur.
                    /// `Card` içinde, kullanıcının adı, e-postası ve telefon numarası
                    /// gösterilir.  `ListTile` tıklandığında, `Get.toNamed()`
                    /// metodu kullanılarak `UserDetailPage` route'u açılır ve
                    /// seçilen kullanıcı verisi parametre olarak gönderilir.
                    User user = controller.users![index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      color: Colors.grey.shade200,
                      child: ListTile(
                        title: Text(user.name!),
                        subtitle: Text(user.email!),
                        trailing: Text(user.phone!),
                        leading: CircleAvatar(child: Text(user.id.toString())),
                        onTap: () => Get.toNamed(Routes.USERS_DETAIL, arguments: user),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
