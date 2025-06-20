import 'package:flutter/material.dart';
import 'package:flutter_db_alistirma/bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/pages.dart';
import 'routes/routes.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance(); // SharedPreferences'ı başlat
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      getPages: Pages.pages,
      initialRoute: Routes.HOME_PAGE,
      initialBinding: HomeBinding(),
    );
  }
}
