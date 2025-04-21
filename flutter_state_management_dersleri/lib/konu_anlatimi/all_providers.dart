// ignore_for_file: non_constant_identifier_names
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management_dersleri/konu_anlatimi/model/sayac_model.dart';
import 'package:flutter_state_management_dersleri/konu_anlatimi/sayac_manager.dart';


final titleProvider = Provider<String>((ref) => "Riverpod Basics");
final titleNotifierProvider = Provider<String>((ref) => "Riverpod Notifier Basics");

final TextProvider = Provider<String>((ref) => "Butona Basilma Sayisi:");
final sayacStateProvider = StateProvider<int>((ref) => 0);
final sayacNotifierProvider = StateNotifierProvider<SayacManager, SayacModel>(
  (ref) => SayacManager(),
);