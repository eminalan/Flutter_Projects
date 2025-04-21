import 'package:flutter/material.dart';
import 'package:flutter_getx_proje/routes/routes.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                    () => Get.toNamed(
                      Routes.PROFILE_PAGE,
                    ), // Butona basıldığında Routes.PROFILE_PAGE rotasına yönlendirir. Get.toNamed(), GetX'in route yönetim fonksiyonudur.
                child: Text("Bir sonraki sayfaya git"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
