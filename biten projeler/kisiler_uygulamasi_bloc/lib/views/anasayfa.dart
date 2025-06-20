// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/cubit/anasayfa_cubti.dart';
import 'package:kisiler_uygulamasi_bloc/entity/kisiler.dart';
import 'package:kisiler_uygulamasi_bloc/views/kisi_detay_sayfa.dart';
import 'package:kisiler_uygulamasi_bloc/views/kisi_kay%C4%B1t_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool arama = false;
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubti>().kisilerYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => KisiKayitSayfasi()))
              .then((value) {
                context.read<AnasayfaCubti>().kisilerYukle();
              });
        },
      ),
      appBar: AppBar(
        title:
            arama
                ? TextField(
                  decoration: InputDecoration(hintText: "ara"),
                  onChanged: (value) {
                    context.read<AnasayfaCubti>().ara(value);
                  },
                )
                : Text('Kisiler'),
        actions: [
          arama
              ? IconButton(
                onPressed: () {
                  setState(() {
                    arama = false;
                  });
                  context.read<AnasayfaCubti>().kisilerYukle();
                },
                icon: Icon(Icons.cancel),
              )
              : IconButton(
                onPressed: () {
                  setState(() {
                    arama = true;
                  });
                },
                icon: Icon(Icons.search),
              ),
        ],
      ),
      body: BlocBuilder<AnasayfaCubti, List<Kisiler>>(
        builder: (context, kisilerListesi) {
          if (kisilerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: kisilerListesi.length,
              itemBuilder: (context, index) {
                var kisi = kisilerListesi[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder:
                                  (context) => KisiDetaySayfasi(kisi: kisi),
                            ),
                          )
                          .then((value) {
                            context.read<AnasayfaCubti>().kisilerYukle();
                          });
                    },
                    child: Card(
                      child: ListTile(
                        title: Text("${kisi.kisi_ad}-${kisi.kisi_tel}"),
                        trailing: IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  kisi.kisi_ad,
                                  style: TextStyle(fontSize: 20),
                                ),
                                action: SnackBarAction(
                                  backgroundColor: Colors.amber,
                                  label: "EVET",
                                  onPressed: () {
                                    context.read<AnasayfaCubti>().sil(
                                      kisi.kisi_id,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
