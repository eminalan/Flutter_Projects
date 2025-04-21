import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Deneme extends StatelessWidget {
  const Deneme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: _misafirGirisi, child: Text("data",)),
      ),
    );
  }

  void _misafirGirisi()async {
  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  print("Oturum açılıdı misafir : ${userCredential.user!.uid}");
  }
}