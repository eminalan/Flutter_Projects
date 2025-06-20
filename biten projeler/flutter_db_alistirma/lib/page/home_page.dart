// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_db_alistirma/controller/home_controller.dart';
import 'package:get/get.dart';

import '../core/widget/costum_button.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX & SharedPreferences')),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CheckboxListTile(
                title: const Text("Bildirimleri Aç/Kapat"),
                value: controller.isChecked.value,
                onChanged: (value) {
                  controller.saveCheckBoxState(value ?? false);
                },
              ),
              const SizedBox(height: 20),
              CostumButton(
                text: "Durumu Kontrol Et",
                onPressed: () {
                  Get.snackbar(
                    'Durum',
                    'Bildirimler: ${controller.isChecked.value ? "Açık" : "Kapalı"}',
                    snackPosition: SnackPosition.TOP,
                  );
                },
              ),
            ],
          );

        }),
      ),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sayı: $_counter',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Arttır! 🚀'),
        ),
      ],
    );
  }
}