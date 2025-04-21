import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_tam_kapsamli_uygulama/UI/themDatas.dart';
import 'package:getx_tam_kapsamli_uygulama/base/inital_bindings.dart';
import 'package:getx_tam_kapsamli_uygulama/routes/pages.dart';
import 'package:getx_tam_kapsamli_uygulama/routes/routes.dart';

void main() {
  runApp(const UserProject());
}

class UserProject extends StatefulWidget {
  const UserProject({super.key});

  @override
  State<UserProject> createState() => _UserProjectState();
}

class _UserProjectState extends State<UserProject> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemData1(),
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
      initialBinding: InitalBinding(),
    );
  }

 
}
