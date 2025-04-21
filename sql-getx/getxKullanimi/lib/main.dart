import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osman2/routes/pages.dart';
import 'package:osman2/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.ANA_SAYFA,
      getPages: Pages.pages,
    );
  }
}
