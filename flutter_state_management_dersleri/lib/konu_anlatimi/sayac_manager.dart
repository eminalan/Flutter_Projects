import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management_dersleri/konu_anlatimi/model/sayac_model.dart';



class SayacManager extends StateNotifier<SayacModel> {
  SayacManager() : super(SayacModel(0));
  void arttir() => state = SayacModel(state.sayacDegeri + 1);
  void azalt() => state = SayacModel(state.sayacDegeri - 1);
}
