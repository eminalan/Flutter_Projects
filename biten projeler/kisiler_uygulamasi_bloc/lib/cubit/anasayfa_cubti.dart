// ignore_for_file: non_constant_identifier_names, await_only_futures

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/entity/kisiler.dart';
import 'package:kisiler_uygulamasi_bloc/repo/kisilerdao_repository.dart';

class AnasayfaCubti extends Cubit<List<Kisiler>> {
  AnasayfaCubti() : super(<Kisiler>[]);
  Future<void> kisilerYukle() async {
    var liste = await KisilerdaoRepository.tumKisileriGoster();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await KisilerdaoRepository.kisiAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int kisi_id) async {
    await KisilerdaoRepository.kisiSil(kisi_id);
    await kisilerYukle();
  }
}
