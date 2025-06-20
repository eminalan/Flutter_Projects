import 'package:bloc_kullanimi/matematik_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int> {
  AnasayfaCubit() : super(0); //  super(0) -> var sayılan değer.

  void toplamaYap(String sayi1, String sayi2) {
    emit(
      MatematikRepository.toplama(sayi1, sayi2),
    ); // emit(toplam)-> setstatenin yerine geçer arayüze aktarır.
  }

  void carpmaYap(String sayi1, String sayi2) {
    emit(MatematikRepository.toplama(sayi1, sayi2));
  }
}
