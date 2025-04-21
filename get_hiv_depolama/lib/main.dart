import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_hive/routes/pages.dart';
import 'package:getx_hive/routes/routes.dart';

import 'services/local_storage/hivee.dart';

void main() async {
  //binding hazırlanıp widget sistemi başlatılıyor..
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  //Hive initialize ediliyor.. Özel Hivee class
  await Hivee.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //Get sistemi başlatılıyor
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hello World',
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      //Get Route sistemi
      //ilk açılacak sayfa tanımlanıyor
      initialRoute: Routes.DENEME,
      //Sayfalar tanımlanıyor
      getPages: Pagess.pages,
    );
  }
}
