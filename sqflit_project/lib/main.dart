import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sqflitedeneme/routes/pages.dart';
import 'package:sqflitedeneme/routes/routes.dart';
import 'package:sqflitedeneme/services/SQLDb/sql_db_helper.dart';

void main()async {
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: Routes.home,
      getPages: Pages.pages,
    );
  }
}

