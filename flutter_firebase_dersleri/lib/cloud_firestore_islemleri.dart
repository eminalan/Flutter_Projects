import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class CloudFirestoreIslemleri extends StatefulWidget {
  const CloudFirestoreIslemleri({Key? key}) : super(key: key);

  @override
  _CloudFirestoreIslemleriState createState() =>
      _CloudFirestoreIslemleriState();
}

class _CloudFirestoreIslemleriState extends State<CloudFirestoreIslemleri> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StreamSubscription? _userSubscribe;

  @override
  Widget build(BuildContext context) {
    //ID'ler
    if (kDebugMode) {
      print(_firestore.collection('users').id);
      print(_firestore.collection('users').doc().id);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Firestore İşlemleri"),
      ),
      body: Center(
          child: Column(
        children: [
          buton(
            () => veriEklemeAdd(),
            Colors.blue,
            "Veri Ekle Add",
          ),
          buton(
            () => veriEklemeSaet(),
            Colors.green,
            "Veri Ekle Set",
          ),
          buton(
            () => veriGuncele(),
            Colors.teal,
            "Veri Güncelle",
          ),
          buton(
            () => veriSil(),
            Colors.red,
            "Veri Sil",
          ),
          buton(
            () => veriOkuOneTime(),
            Colors.orange,
            "Veri Oku One Time",
          ),
          buton(
            () => veriOkuRealTime(),
            Colors.blueGrey,
            "Veri Oku Real Time",
          ),
          buton(
            () => streamDurdur(),
            Colors.purple,
            "Stream Durdur",
          ),
          buton(
            () => batchKavrami(),
            Colors.lightBlue,
            "Batch Kavramı",
          ),
          buton(
            () => transactionKavrami(),
            Colors.deepOrange,
            "Transaction Kavramı",
          ),
          buton(
            () => queryingData(),
            Colors.deepPurple,
            "Querying Data",
          ),
          buton(
            () => kameraGaleriImageUpload(),
            Colors.tealAccent,
            "Kamera Galeri Image Upload",
          ),
        ],
      )),
    );
  }

  ElevatedButton buton(void Function()? onPressed, Color? color, String? isim) {
    return ElevatedButton(
      onPressed: () => onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(isim!),
    );
  }

  void veriEklemeAdd() async {
    Map<String, dynamic> _ekleneceUsers = <String, dynamic>{};
    _ekleneceUsers['isim'] = 'emin';
    _ekleneceUsers['yas'] = 18;
    _ekleneceUsers['ôgrenciMi'] = true;
    _ekleneceUsers['adres'] = {'il': 'siirt', 'ilce': 'kurtalan'};
    _ekleneceUsers['renkler'] = FieldValue.arrayUnion(['mavi', 'yesil']);
    _ekleneceUsers['createdAt'] = FieldValue.serverTimestamp();
    await _firestore.collection('users').add(_ekleneceUsers);
  }

  void veriEklemeSaet() async {
    var _yeniDocID = _firestore.collection('users').doc().id;
    await _firestore.doc('users/$_yeniDocID').set(
      {
        'isim': 'emin ',
        'usersID': _yeniDocID,
      },
    );

    await _firestore.doc('users/cMb7OEF4vZUIDTTCUluL').set(
      {
        'okul': 'Siirt Üniversitesi',
        'yas': FieldValue.increment(1),
      },
      SetOptions(merge: true),
    );
  }

  void veriGuncele() async {
    await _firestore.doc('users/cMb7OEF4vZUIDTTCUluL').update({
      'adres.ilce': 'baykan',
    });
  }

  void veriSil() async {
    _firestore.doc('users/dxJi1WjMTLydqXugDdtg').delete();
  }

  veriOkuOneTime() async {
    var _usersDocuments = await _firestore.collection('users').get();
    if (kDebugMode) {
      // print("Uzunluk :  ${_usersDocuments.size}");--riskli
      print("uzunluk : ${_usersDocuments.docs.length}");
      for (var eleman in _usersDocuments.docs) {
        print("Dökümna ID : ${eleman.id}");
        Map userMap = eleman.data();
        print("İsim : ${userMap['isim']}");
      }
    }

    var _eminDoc = await _firestore.doc('users/GYFNf3RnFDbJwJQ6oBQs').get();
    if (kDebugMode) {
      print("Emin Döküman ID : ${_eminDoc.data()}");
    }
  }

  veriOkuRealTime() async {
    var _usersStream = await _firestore.collection('users').snapshots();
    _userSubscribe = _usersStream.listen(
      (event) {
        /*event.docChanges.forEach((element) {
          if (kDebugMode) {
            print(element.doc.data().toString());
          }
        });*/
        event.docs.forEach((element) {
          if (kDebugMode) {
            print(element.data().toString());
          }
        });
      },
    );
  }

  streamDurdur() async {
    await _userSubscribe?.cancel();
  }

  batchKavrami() async {
    WriteBatch _batch = _firestore.batch();
    CollectionReference _counterColRef = _firestore.collection('counter');
    /*
     for (var i = 0; i < 5; i++) {
      var _yeniDoc=_counterColRef.doc();
      _batch.set(_yeniDoc, {'sayi': ++i,'docID':_yeniDoc.id});                          veriyi getirme anlık olarak
    }
    */

    /* 
    var _conterDoc = await _counterColRef.get();
    _conterDoc.docs.forEach(
      (element) {
        _batch.update(                                                                    Güncelleme
            element.reference, {'createdAt': FieldValue.serverTimestamp()});
      },
    );
    */
    var _conterDoc = await _counterColRef.get();
    _conterDoc.docs.forEach(
      (element) {
        _batch.delete(element.reference); //Silme
      },
    );

    await _batch.commit();
  }

  transactionKavrami() async {
    _firestore.runTransaction(
      (transaction) async {
        //bakiyeyi öğren
        //100 lira düş
        //100 lira ekle
        DocumentReference<Map<String, dynamic>> eminRef =
            _firestore.doc('users/GYFNf3RnFDbJwJQ6oBQs');
        DocumentReference<Map<String, dynamic>> aliRef =
            _firestore.doc('users/dxJi1WjMTLydqXugDdtg');
        var _eminBakiyeSnanpshot = await transaction.get(eminRef);
        var eminBakiye = _eminBakiyeSnanpshot.data()!['para'];
        if (eminBakiye > 100) {
          var _yeniBakiye = _eminBakiyeSnanpshot.data()!['para'] - 100;
          transaction.update(eminRef, {'para': _yeniBakiye});
          transaction.update(aliRef, {'para': FieldValue.increment(100)});
        }
      },
    );
  }

  queryingData() async {
    var _userRef = _firestore.collection('users');
    var _sonuc = await _userRef.where('yas', isEqualTo: 18).get();
    for (var eleman in _sonuc.docs) {
      if (kDebugMode) {
        print("Dökümna DATA : ${eleman.data()}");
      }
    }
  }

  kameraGaleriImageUpload() async {
    final ImagePicker _picker = ImagePicker();
    XFile? _file = await _picker.pickImage(source: ImageSource.camera);
    var _progileRef = FirebaseStorage.instance.ref('users/profil_resimleri');
    var _task = _progileRef.putFile(File(_file!.path));
    _task.whenComplete(
      () async {
        if (kDebugMode) {
          var _url = await _progileRef.getDownloadURL();

          print(_url.toString());
        }
      },
    );
  }
}
