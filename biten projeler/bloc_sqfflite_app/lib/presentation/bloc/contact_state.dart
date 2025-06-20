import '../../domain/entities/rehper.dart';

// Bloc için tüm State'ler burada tanımlanır
abstract class ContactState {}

class ContactInitial extends ContactState {} // İlk açılış durumu

class ContactLoading extends ContactState {} // Yükleniyor

class ContactLoaded extends ContactState {
  final List<Rehper> contacts;
  ContactLoaded(this.contacts); // Yüklenen kişi listesi
}

class ContactError extends ContactState {
  final String message;
  ContactError(this.message); // Hata durumu
}