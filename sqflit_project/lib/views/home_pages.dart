import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:sqflitedeneme/o_package/o_extensions.dart';
import 'package:sqflitedeneme/view_model/vm_home_page.dart';

import '../models/model_kisi.dart';

class HomePages extends StatelessWidget {
  HomePages({super.key});
  final vmHomePage = Get.find<VmHomePage>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage")),
      body: _buildBody(context),
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return [
      Obx(() {
        if (vmHomePage.kisilerList.isEmpty) {
          return const Center(child: Text("Kişi Bulunamadı")).oExpand();
        } else {
          if (vmHomePage.isLoad.value) {
            return ListView.builder(
              itemCount: vmHomePage.kisilerList.length,

              itemBuilder: (context, index) {
                var kisi = vmHomePage.kisilerList[index];
                return _buildListTile(kisi, context);
              },
            ).oBox.color(Colors.red).make().oExpand();
          } else {
            return const Center(child: CircularProgressIndicator()).oExpand();
          }
        }
      }),
    ].oColumn.make().paddingAll(8);
  }

  ListTile _buildListTile(ModelKisi kisi, BuildContext context) {
    return ListTile(
      title: Text(kisi.ad),
      subtitle: Text(kisi.id_kisi.toString()),
      leading: IconButton(
        color: Colors.white,
        onPressed: () {
          _buildDialog(context, kisi: kisi);
        },
        icon: Icon(Icons.edit),
      ),
      trailing: IconButton(
        color: Colors.white,
        onPressed: () {
          _buildDeleteDialog(context, kisi);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }

  Future<dynamic> _buildDeleteDialog(BuildContext context, ModelKisi kisi) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sil"),
          content: const Text("Silmek istediğinize emin misiniz?"),
          actions: [
            "Hayır".oElevatedButton.textColorRed.onPressed(() {
              Get.back();
            }).make(),
            "Evet".oElevatedButton.color(Colors.black).onPressed(() {
              vmHomePage.deleteKisiler(kisi);
              Get.back();
            }).make(),
          ],
        );
      },
    );
  }

  _buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _buildDialog(context);
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  void _buildDialog(BuildContext context, {ModelKisi? kisi}) {
    final _formKey = GlobalKey<FormBuilderState>();
    String okText = kisi != null ? "Kişi Güncelle" : "Kişi Ekle";
    Get.dialog(
      AlertDialog(
        title: const Text("Kişi Ekle"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'isim',
                    initialValue: kisi?.ad,
                    decoration: const InputDecoration(
                      labelText: 'İsim',
                      border: OutlineInputBorder(),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'İsim boş olamaz',
                      ),
                      FormBuilderValidators.minLength(
                        3,
                        errorText: 'İsim 3 karakterden az olamaz',
                      ),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'soyisim',
                    initialValue: kisi?.soyad,
                    decoration: const InputDecoration(
                      labelText: 'Soyisim',
                      border: OutlineInputBorder(),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Boş olamaz'),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'yas',
                    initialValue: kisi?.yas.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Yaş',
                      border: OutlineInputBorder(),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Boş olamaz'),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          "Vazgec".oElevatedButton.textColorRed.onPressed(() {
            Get.back();
          }).make(),
          okText.oElevatedButton.color(Colors.black).onPressed(() {
            if (_formKey.currentState?.saveAndValidate() ?? false) {
              String isim = _formKey.currentState!.fields['isim']!.value;
              String soy = _formKey.currentState!.fields['soyisim']!.value;
              String yas = _formKey.currentState!.fields['yas']!.value;
              if (kisi != null) {
                Get.back();
                //update işlemi
                ModelKisi updatedKisi = ModelKisi(
                  id_kisi: kisi.id_kisi,
                  ad: isim,
                  soyad: soy,
                  yas: yas.toInt,
                );
                vmHomePage.updateKisiler(updatedKisi);
              } else {
                // Yeni kişi ekleme işlemi
                ModelKisi newKisi = ModelKisi(
                  ad: isim,
                  soyad: soy,
                  yas: yas.toInt,
                );
                vmHomePage.createKisiler(newKisi);
              }

              Get.back();
            } else {
              //Get.snackbar("Hata", "Form geçersiz!");
            }
          }).make(),
        ],
      ),
    );
  }
}
