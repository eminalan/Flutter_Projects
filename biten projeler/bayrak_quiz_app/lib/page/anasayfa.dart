import 'package:bayrak_quiz_app/page/quiz_ekran.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anasayfa')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quiz Uygulamasına Hoş Geldiniz!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 100),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Burada QuizEkran'a yönlendirme yapılacak
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizEkran()),
                  );
                },
                child: const Text('Quiz Başlat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
