import '../entities/rehper.dart';

abstract class ContactRepository {
  Future<List<Rehper>> getContacts(); // Listele
  Future<void> addContact(Rehper contact); // Ekle
  Future<void> updateContact(Rehper contact); // Güncelle
  Future<void> deleteContact(int id); // Sil
}