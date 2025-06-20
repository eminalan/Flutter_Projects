// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:bayrak_quiz_app/bayrak_crud.dart';
import 'package:bayrak_quiz_app/model/bayrak_model.dart';
import 'package:bayrak_quiz_app/page/sonuc_ekran.dart';
import 'package:flutter/material.dart';

class QuizEkran extends StatefulWidget {
  const QuizEkran({super.key});

  @override
  State<QuizEkran> createState() => _QuizEkranState();
}

class _QuizEkranState extends State<QuizEkran> {
  late BayrakModel dogruSoru;
  List<BayrakModel> tumSecenekler = [];

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;
  String bayrakResimAdi = "placeholder.png";
  String button_a_yazi = "";
  String button_b_yazi = "";
  String button_c_yazi = "";
  String button_d_yazi = "";

  @override
  void initState() {
    super.initState();
    sorulariAl();
  }

  Future<void> sorulariAl() async {
    await soruYukle(); // İlk soruyu yükle
  }

  Future<void> soruYukle() async {
    List<BayrakModel> sorular = await BayrakCrud().rastgele5Getir();
    dogruSoru = sorular[soruSayac];
    bayrakResimAdi = dogruSoru.bayrak_resim;

    List<BayrakModel> yanlisSecenekler =
        await BayrakCrud().rastgele3YanlisGetir(dogruSoru.bayrak_id);

    tumSecenekler = [dogruSoru, ...yanlisSecenekler]..shuffle();

    button_a_yazi = tumSecenekler[0].bayrak_ad;
    button_b_yazi = tumSecenekler[1].bayrak_ad;
    button_c_yazi = tumSecenekler[2].bayrak_ad;
    button_d_yazi = tumSecenekler[3].bayrak_ad;

    setState(() {});
  }

  void dogruCevapKontrol(String buttonYazi) {
    if (dogruSoru.bayrak_ad == buttonYazi) {
      dogruSayac++;
    } else {
      yanlisSayac++;
    }
    soruSayacKontrol();
  }

  void soruSayacKontrol() {
    soruSayac++;
    if (soruSayac < 5) {
      soruYukle();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SonucEkran(dogruSayisi: dogruSayac),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Ekranı')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Doğru Cevap: $dogruSayac",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Yanlış Cevap: $yanlisSayac",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "${soruSayac + 1}. Soru",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/bayrak/$bayrakResimAdi',
              height: 200,
              width: 300,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  dogruCevapKontrol(button_a_yazi);
                },
                child: Text(button_a_yazi),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  dogruCevapKontrol(button_b_yazi);
                },
                child: Text(button_b_yazi),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  dogruCevapKontrol(button_c_yazi);
                },
                child: Text(button_c_yazi),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  dogruCevapKontrol(button_d_yazi);
                },
                child: Text(button_d_yazi),
              ),
            ),
          ],
        ),
      ),
    );
  }
}