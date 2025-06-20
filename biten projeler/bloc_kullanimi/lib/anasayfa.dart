import 'package:bloc_kullanimi/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  TextEditingController sayi1 = TextEditingController();
  TextEditingController sayi2 = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anasayfa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //BlocBuilder dinleme işlemi yapılır.
              BlocBuilder<AnasayfaCubit, int>(
                builder: (context, state) {
                  return Text(state.toString(), style: TextStyle(fontSize: 30));
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: sayi1,
                decoration: InputDecoration(hintText: "1. Sayıyı Giriniz"),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: sayi2,
                decoration: InputDecoration(hintText: "2. Sayıyı Giriniz"),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String value1 = sayi1.text;
                      String value2 = sayi2.text;
                      // okuma işlemi
                      context.read<AnasayfaCubit>().toplamaYap(value1, value2);
                    },
                    child: Text("TOPLAMA"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      String value1 = sayi1.text;
                      String value2 = sayi2.text;
                      // okuma işlemi
                      context.read<AnasayfaCubit>().carpmaYap(value1, value2);
                    },
                    child: Text("ÇARPMA"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
