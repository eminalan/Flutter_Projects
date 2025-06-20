import '../../domain/entities/rehper.dart';

// Bloc için tüm Event'ler burada tanımlanır
abstract class ContactEvent {}

class LoadContacts extends ContactEvent {} // Kişileri yükle

class AddNewContact extends ContactEvent {
  final Rehper contact;
  AddNewContact(this.contact); // Yeni kişi ekle
}

class UpdateExistingContact extends ContactEvent {
  final Rehper contact;
  UpdateExistingContact(this.contact); // Kişiyi güncelle
}

class DeleteExistingContact extends ContactEvent {
  final int id;
  DeleteExistingContact(this.id); // Kişiyi sil
}