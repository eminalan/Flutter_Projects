// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/cubit/kisi_detay_cubit.dart';

import 'package:kisiler_uygulamasi_bloc/entity/kisiler.dart';

class KisiDetaySayfasi extends StatefulWidget {
  KisiDetaySayfasi({super.key, required this.kisi});
  Kisiler kisi;

  @override
  State<KisiDetaySayfasi> createState() => _KisiDetaySayfasiState();
}

class _KisiDetaySayfasiState extends State<KisiDetaySayfasi> {
  TextEditingController ad = TextEditingController();
  TextEditingController telefon = TextEditingController();

  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    ad.text = kisi.kisi_ad;
    telefon.text = kisi.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Güncelle')),
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
                  context.read<KisiDetayCubit>().guncelle(
                    widget.kisi.kisi_id,
                    widget.kisi.kisi_ad,
                    widget.kisi.kisi_tel,
                  );
                },
                child: Text("Güncelle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
