// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class KonumAlma extends StatefulWidget {
  const KonumAlma({super.key});

  @override
  State<KonumAlma> createState() => _KonumAlmaState();
}

class _KonumAlmaState extends State<KonumAlma> {
  double enlem = 0.0;
  double boylam = 0.0;

  Future<void> konumBilgisiAl() async {
    bool servisAcik = await Geolocator.isLocationServiceEnabled();
    if (!servisAcik) {
      // Konum servisi kapalıysa kullanıcıya bildir
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Lütfen konum servislerini açın")),
      );
      return;
    }

    LocationPermission izin = await Geolocator.checkPermission();

    if (izin == LocationPermission.denied) {
      izin = await Geolocator.requestPermission();
      if (izin == LocationPermission.denied) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Konum izni reddedildi.")));
        return;
      }
    }

    if (izin == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Konum izni kalıcı olarak reddedildi. Ayarlardan açmalısınız.",
          ),
        ),
      );
      await Geolocator.openAppSettings();
      return;
    }

    // İzin verildiyse konumu al
    try {
      Position konum = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        enlem = konum.latitude;
        boylam = konum.longitude;
      });
    } catch (e) {
      // Her ihtimale karşı hata yakala
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Hata: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Harita')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Enlem : $enlem ",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Boylam : $boylam",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: konumBilgisiAl,
              child: const Text("Konum Bilgisi Al"),
            ),
          ],
        ),
      ),
    );
  }
}
