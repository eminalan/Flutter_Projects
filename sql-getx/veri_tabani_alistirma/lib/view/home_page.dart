import 'package:flutter/material.dart';
import 'package:veri_tabani_alistirma/data/yerel_veri_tabani.dart';
    
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VeritabaniYardimcisi _veriTabani = VeritabaniYardimcisi();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}