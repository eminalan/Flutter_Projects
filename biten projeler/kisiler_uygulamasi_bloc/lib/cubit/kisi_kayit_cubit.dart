// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/repo/kisilerdao_repository.dart';

class KisiKayitCubit extends Cubit<void> {
  KisiKayitCubit() : super(0);
  Future<void> kayit(String kisi_ad, String kisi_tel) async {
    await KisilerdaoRepository.kisikayit(kisi_ad, kisi_tel);
  }
}
