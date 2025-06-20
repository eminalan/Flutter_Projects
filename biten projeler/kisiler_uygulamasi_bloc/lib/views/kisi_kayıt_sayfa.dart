// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/cubit/kisi_kayit_cubit.dart';

class KisiKayitSayfasi extends StatefulWidget {
  const KisiKayitSayfasi({super.key});

  @override
  State<KisiKayitSayfasi> createState() => _KisiKayitSayfasiState();
}

class _KisiKayitSayfasiState extends State<KisiKayitSayfasi> {
  TextEditingController ad = TextEditingController();
  TextEditingController telefon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kayıt')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: ad,
                decoration: InputDecoration(hintText: "Ad ?"),
              ),
              SizedBox(height: 20),
              TextField(
                controller: telefon,
                decoration: InputDecoration(hintText: "Telefon ?"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<KisiKayitCubit>().kayit(ad.text, telefon.text);
                },
                child: Text("Kaydet"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
