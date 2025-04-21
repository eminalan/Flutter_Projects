import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/model/response/user.dart';
import 'package:getx_tam_kapsamli_uygulama/module/users/controller.dart';
import 'package:getx_tam_kapsamli_uygulama/routes/routes.dart';

class UserPage extends GetView<UserPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Page'), centerTitle: true),

      body: GetBuilder<UserPageController>(
        builder: (_) {
          return controller.users == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: controller.users!.length,
                itemBuilder: (context, index) {
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
