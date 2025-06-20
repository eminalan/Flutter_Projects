
import 'package:bloc_sqfflite_app/domain/entities/rehper.dart';
import 'package:bloc_sqfflite_app/domain/repositories/contact_repository.dart';

/// Var olan bir kişiyi güncellemek için use case
class UpdateContact {
final ContactRepository repository;

UpdateContact(this.repository);

/// Repository üzerinden güncelleme işlemini gerçekleştirir
Future call(Rehper contact) async {
await repository.updateContact(contact);
}
}