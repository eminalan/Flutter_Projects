import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HaritaAcma extends StatefulWidget {
  const HaritaAcma({super.key});

  @override
  State<HaritaAcma> createState() => _HaritaAcmaState();
}

class _HaritaAcmaState extends State<HaritaAcma> {
  Completer<GoogleMapController> haritaitacontrol = Completer();
  var baslangicKonum = CameraPosition(target: LatLng(38.000, 27.000), zoom: 5);
  List<Marker> isaretler = [];
  var gidilecek = CameraPosition(
    target: LatLng(41.0039643, 27.4517462),
    zoom: 10,
  );
  Future<void> konumaGit() async {
    var gidilecekIsaret = Marker(
      markerId: MarkerId("Id"),
      

      position: gidilecek.target,
      infoWindow: InfoWindow(title: "istanbul", snippet: "evim"),
    );
    setState(() {
      isaretler.add(gidilecekIsaret);
    });

    GoogleMapController googleMapController = await haritaitacontrol.future;
    googleMapController.animateCamera(
      duration: const Duration(seconds: 2),
      CameraUpdate.newCameraPosition(gidilecek),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Harita Açma')),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: baslangicKonum,
              mapType: MapType.normal,
              markers: isaretler.toSet(),
              onMapCreated: (GoogleMapController controller) {
                haritaitacontrol.complete(controller);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              konumaGit();
            },
            child: Text("konuma"),
          ),
        ],
      ),
    );
  }
}





//AIzaSyAJfGeBCNVqZg6luVv9AZJsw0pD0CTG-0c