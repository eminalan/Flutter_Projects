// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter_application/models/kelime.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_page_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controlle = Get.find<HomePageController>();
  TextEditingController trController = TextEditingController();
  TextEditingController enController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFAB(context),
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Column _buildBody() {
    return Column(
      children: [
        Obx(() {
          if (controlle.isLoad.value) {
            return Expanded(child: _buildListViewBuilder());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ],
    );
  }

  ListView _buildListViewBuilder() {
    return ListView.builder(
      itemCount: controlle.kelimelerList.length,
      itemBuilder: (context, index) {
        var kelime = controlle.kelimelerList[index];
        return _BuildInkWell(kelime, context);
      },
    );
  }

  InkWell _BuildInkWell(Kelime kelime, BuildContext context) {
    return InkWell(
      onLongPress: () {
        Get.defaultDialog(
          title: 'Sil',
          middleText: 'Silmek istediğinize emin misiniz?',
          confirm: TextButton(
            onPressed: () {
              controlle.deleteKisiler(kelime);
              Get.back();
            },
            child: const Text('Evet'),
          ),
          cancel: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Hayır'),
          ),
        );
      },
      onDoubleTap: () {
        trController.text = kelime.tr;
        enController.text = kelime.en;
        Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            titlePadding: const EdgeInsets.all(16),
            contentPadding: const EdgeInsets.all(16),
            title: Center(
              child: Text(
                'Kelime Güncelle',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: trController,
                  decoration: const InputDecoration(
                    hintText: 'Türkçe',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: enController,
                  decoration: const InputDecoration(
                    hintText: 'İngilizce',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        //güncelleme işlemi
                        controlle.updateKisiler(
                          Kelime(
                            id: kelime.id,
                            tr: trController.text,
                            en: enController.text,
                          ),
                        );
                        Get.back();
                      },
                      child: const Text('Güncelle'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('iptal'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      child: Card(
        color: Colors.black,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.blue,
        elevation: 5,
        child: ListTile(
          title: Text(kelime.tr, style: _styleaBeeZee(context)),
          trailing: Text(kelime.en, style: _styleaBeeZee(context)),
        ),
      ),
    );
  }

  FloatingActionButton _buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.dialog(
          barrierDismissible: false,
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            titlePadding: const EdgeInsets.all(16),
            contentPadding: const EdgeInsets.all(16),
            title: Center(
              child: Text(
                'Kelime Ekle',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: trController,
                  decoration: const InputDecoration(
                    hintText: 'Türkçe',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: enController,
                  decoration: const InputDecoration(
                    hintText: 'İngilizce',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        //ekleme işlemi
                        controlle.createKelime(
                          Kelime(tr: trController.text, en: enController.text),
                        );
                        Get.back();
                      },
                      child: const Text('Ekle'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('iptal'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      child: Icon(Icons.add),
    );
  }

  TextStyle _styleaBeeZee(BuildContext context) {
    return GoogleFonts.aBeeZee(
      textStyle: Theme.of(context).textTheme.displayLarge,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'İngilizce-Türkçe Sözlük',
        style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.displayLarge,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),
      ),
      centerTitle: true,
    );
  }
}
