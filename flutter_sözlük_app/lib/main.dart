import 'package:flutter/material.dart';
import 'package:flutter_application/home_page/home_page_controller.dart';
import 'package:flutter_application/routes/pages.dart';
import 'package:flutter_application/routes/routes.dart';
import 'package:flutter_application/services/SQL/sql_db_helper.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(HomePageController());
  WidgetsFlutterBinding.ensureInitialized();
  await SqlDBHelper.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      initialRoute: Routes.HOME_PAGE,
     theme: ThemeData.dark(),
    );
  }
}
