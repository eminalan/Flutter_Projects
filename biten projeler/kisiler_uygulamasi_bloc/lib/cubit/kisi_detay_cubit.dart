// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/repo/kisilerdao_repository.dart';

class KisiDetayCubit extends Cubit<void> {
  KisiDetayCubit () : super(0);


 Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    KisilerdaoRepository.kisiGuncelle(kisi_id, kisi_ad, kisi_tel);
  }
}
