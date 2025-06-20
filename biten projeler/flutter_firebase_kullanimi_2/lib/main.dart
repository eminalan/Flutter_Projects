// ignore_for_file: avoid_print

import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_kullanimi_2/model/kisiler.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 🔧 Burası eklendi
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler_tablo");

  Future<void> kisiEkle() async {
    //veri ekleme
    HashMap<String, dynamic> bilgi = HashMap<String, dynamic>();
    bilgi["kisi_ad"] = "ali";
    bilgi["kisi_yas"] = 10;
    refKisiler.push().set(bilgi);
  }

  Future<void> kisiSil() async {
    refKisiler.child("-OSYNUi0TqDxboNOeL3z").remove();
  }

  Future<void> kisiGuncelle() async {
    HashMap<String, dynamic> guncelBilgi = HashMap<String, dynamic>();
    guncelBilgi["kisi_ad"] = "ela";
    guncelBilgi["kisi_yas"] = 10;
    refKisiler.child("-OSYNXPtOVEgBCHU1fv1").update(guncelBilgi);
  }

  //tum kisileri anllık CRUD işlemi
  Future<void> tumKisilerAnlikOku() async {
    refKisiler.onValue.listen((event) {
      var gelenDeger = event.snapshot.value;

      if (gelenDeger != null) {
        var jsonList = Map<String, dynamic>.from(gelenDeger as Map);
        List<Kisiler> kisilerListesi = [];

        jsonList.forEach((key, value) {
          var kisi = Kisiler.fromJson(Map<String, dynamic>.from(value));
          kisilerListesi.add(kisi);
        });

        // Listeyi yazdır
        for (var k in kisilerListesi) {
          print("Ad: ${k.kisi_ad}, Yaş: ${k.kisi_yas}");
        }
      } else {
        print("Veri bulunamadı.");
      }
    });
  }

  Future<void> tumKisilerTekSeferOkuma() async {
    refKisiler.once().then((value) {
      var gelenDeger = value.snapshot.value;

      if (gelenDeger != null) {
        var jsonList = Map<String, dynamic>.from(gelenDeger as Map);
        List<Kisiler> kisilerListesi = [];

        jsonList.forEach((key, value) {
          var kisi = Kisiler.fromJson(Map<String, dynamic>.from(value));
          kisilerListesi.add(kisi);
        });

        // Listeyi yazdır
        for (var k in kisilerListesi) {
          print("Ad: ${k.kisi_ad}, Yaş: ${k.kisi_yas}");
        }
      } else {
        print("Veri bulunamadı.");
      }
    });
  }

  Future<void> kisiArama() async {
    var sorgu = refKisiler.orderByChild("kisi_ad").equalTo("emin");

    sorgu.onValue.listen((event) {
      var gelenDeger = event.snapshot.value;

      if (gelenDeger != null) {
        var jsonList = Map<String, dynamic>.from(gelenDeger as Map);
        List<Kisiler> kisilerListesi = [];

        jsonList.forEach((key, value) {
          var kisi = Kisiler.fromJson(Map<String, dynamic>.from(value));
          kisilerListesi.add(kisi);
        });

        // Listeyi yazdır
        for (var k in kisilerListesi) {
          print("Ad: ${k.kisi_ad}, Yaş: ${k.kisi_yas}");
        }
      } else {
        print("Veri bulunamadı.");
      }
    });
  }

  Future<void> sorguLimit() async {
    var sorgu = refKisiler.limitToFirst(2);

    sorgu.onValue.listen((event) {
      var gelenDeger = event.snapshot.value;

      if (gelenDeger != null) {
        var jsonList = Map<String, dynamic>.from(gelenDeger as Map);
        List<Kisiler> kisilerListesi = [];

        jsonList.forEach((key, value) {
          var kisi = Kisiler.fromJson(Map<String, dynamic>.from(value));
          kisilerListesi.add(kisi);
        });

        // Listeyi yazdır
        for (var k in kisilerListesi) {
          print("Ad: ${k.kisi_ad}, Yaş: ${k.kisi_yas}");
        }
      } else {
        print("Veri bulunamadı.");
      }
    });
  }

  Future<void> degerAraligiindaSorgula() async {
    var sorgu = refKisiler.orderByChild("kisi_yas").startAt(10).endAt(25);

    sorgu.onValue.listen((event) {
      var gelenDeger = event.snapshot.value;

      if (gelenDeger != null) {
        var jsonList = Map<String, dynamic>.from(gelenDeger as Map);
        List<Kisiler> kisilerListesi = [];

        jsonList.forEach((key, value) {
          var kisi = Kisiler.fromJson(Map<String, dynamic>.from(value));
          kisilerListesi.add(kisi);
        });

        // Listeyi yazdır
        for (var k in kisilerListesi) {
          print("Ad: ${k.kisi_ad}, Yaş: ${k.kisi_yas}");
        }
      } else {
        print("Veri bulunamadı.");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    degerAraligiindaSorgula();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
