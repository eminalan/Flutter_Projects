import 'package:bloc_sqfflite_app/domain/entities/rehper.dart';
import 'package:bloc_sqfflite_app/domain/repositories/contact_repository.dart';


// Yeni kişi ekleme iş kuralı
class AddContact {
  final ContactRepository repository;
  AddContact(this.repository);

  Future<void> call(Rehper contact) async {
    await repository.addContact(contact);
  }
}