import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tam_kapsamli_uygulama/module/user_detail/controller.dart';

class UserDetailPage extends GetView<UserDetailPageController> {
  @override
  Widget build(BuildContext context) {
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
