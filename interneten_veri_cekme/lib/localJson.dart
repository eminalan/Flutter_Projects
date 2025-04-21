import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interneten_veri_cekme/model/araba_model.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({Key? key}) : super(key: key);

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  @override
  Widget build(BuildContext context) {
    arabalarJsonOku();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local JSON'),
      ),
      body: Container(
        child: FutureBuilder<List<ArabaModel>>(
          future: arabalarJsonOku(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<ArabaModel>? arabaListesi = snapshot.data!;
              return ListView.builder(
                itemCount: arabaListesi!.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(arabaListesi[index].arabaAdi.toString()),
                  subtitle: Text(arabaListesi[index].ulke.toString()),
                  trailing: Text(arabaListesi[index].kurulusYil.toString()),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                snapshot.error.toString(),
              ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<ArabaModel>> arabalarJsonOku() async {
    String okunanString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/arabalar.json");
    var jsonObject = jsonDecode(okunanString);

    /*  if (kDebugMode) {
      print(okunanString);
      print("---------------------");
      List arabaListesi = jsonObject;
      print(arabaListesi[0]);
    }*/

    List<ArabaModel> tumArabalar =
        (jsonObject as List).map((e) => ArabaModel.fromMap(e)).toList();

    if (kDebugMode) {
      print(tumArabalar[0].arabaAdi.toString());
    }
    return tumArabalar;
  }
}
