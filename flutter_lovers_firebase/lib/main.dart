import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_lovers/landing_page.dart';
import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/viewModel/user_model.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator(); // Servislerin tekrar kaydedilmesini önlemek için düzenlendi.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lovers',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => UserModel(),
        builder: (context, child) => LandingPage(),
      ),
    );
  }
}
